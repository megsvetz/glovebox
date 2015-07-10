require 'rails_helper'


RSpec.describe RegistrationsController, type: :controller do
  login_user

  before(:each) do 
    @vehicle = FactoryGirl.create(:vehicle)
  end

  let(:registration) {FactoryGirl.create(:registration)}

  describe "GET #index" do
    it "returns http success" do
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

    it "was NOT created" do
     post :create, vehicle_id: @vehicle.id,  registration: {state: nil}
     expect(response).to_not have_http_status(:redirect)
     expect(flash[:error]).to be_present
    end
  end

  describe "PUT #update" do
   it "updated successfully!" do
     new_state = "new state"
     put :update, vehicle_id: @vehicle.id, id: registration.id, registration: {state: 'new state'}
     expect(response).to have_http_status(:redirect)
     updated_registration = registration.reload
     expect(updated_registration.state).to eq(new_state)
     expect(flash[:notice]).to be_present
   end

   it "did NOT update!" do
     new_state = "new state"
     put :update, vehicle_id: @vehicle.id, id: registration.id, registration: {state: nil}
     expect(response).to render_template(:edit)
     updated_registration = registration.reload
     expect(updated_registration.state).to_not eq(new_state)
     expect(flash[:error]).to be_present
   end 
 end

  describe "GET #edit" do
    it "Edits registration" do
      get :edit, vehicle_id: @vehicle.id, id:registration.id, registration:{state:'New State'}
      expect(response).to have_http_status(:success)
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
