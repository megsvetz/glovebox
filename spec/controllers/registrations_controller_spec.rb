require 'rails_helper'


RSpec.describe RegistrationsController, type: :controller do

  before(:each) do 
    @user = FactoryGirl.create(:user)
    @vehicle = FactoryGirl.create(:vehicle, user: @user)
    sign_in @user
  end

  let(:registration) {FactoryGirl.create(:registration, vehicle: @vehicle)}

  describe "GET #index" do
    it "returns http success" do
      get :index , vehicle_id: @vehicle.id 
      expect(response).to have_http_status(:success)
    end
    it "returns http success When Premium user" do
      @user.membership = 1
      @user.save
      get :index , vehicle_id: @vehicle.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, vehicle_id: @vehicle.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "created successfully" do
      post :create, vehicle_id: @vehicle.id, registration: {state:'California' , expiration: Faker::Date.between(2.days.ago, Date.today), cost: 2000 }
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "PUT #update" do
    it "updated successfully!" do
     new_state = "new state"
     put :update, vehicle_id: @vehicle.id, id: registration.id, registration: {state: new_state}
     expect(response).to have_http_status(:redirect)
     # updated_registration = registration.reload
     expect(registration.reload.state).to eq(new_state)
     expect(flash[:notice]).to be_present
    end
  end

  describe "GET #edit" do
    it "Edits registration" do
      get :edit, vehicle_id: @vehicle.id, id:registration.id, registration:{state:'New State'}
      expect(response).to have_http_status(:success)
    end

    it "Can only edit your items" do
      @vehicle.user_id = 80085
      @vehicle.save
      get :edit, vehicle_id: @vehicle.id, id:registration.id, registration:{state:'New State'}
      expect(response).to have_http_status(:redirect)
    end

    it 'doesnt edit' do
      get :edit, vehicle_id: @vehicle.id, id: 60000 , registration:{state:'New State'}
      expect(response).to_not have_http_status(:success)
    end

  end

  describe "GET #show" do
    it "returns http success" do
      get :show, vehicle_id: @vehicle.id, id: registration.id
      expect(response).to have_http_status(:success)
    end
  end

end
