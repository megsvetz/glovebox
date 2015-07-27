require 'rails_helper'


RSpec.describe InsurancesController, type: :controller do

  before(:each) do
    @user = FactoryGirl.create(:user)
    @vehicle = FactoryGirl.create(:vehicle, user: @user)
    sign_in @user
  end

  let(:insurance) {FactoryGirl.create(:insurance, vehicle: @vehicle)}

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
      post :create, vehicle_id: @vehicle.id, insurance: {policy_number:'ABC123' , company: 'Geico' ,  vehicle_id: @vehicle.id }
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "PUT #update" do
    it "updated successfully!" do
     policy_number = "ABCD1234"
     put :update, vehicle_id: @vehicle.id, id: insurance.id, insurance: {policy_number: policy_number}
     expect(response).to have_http_status(:redirect)
     # updated_registration = registration.reload
     expect(insurance.reload.policy_number).to eq(policy_number)
     expect(flash[:notice]).to be_present
    end
  end

  describe "GET #edit" do
    it "Edits insurance" do
      get :edit, vehicle_id: @vehicle.id, id:insurance.id, insurance:{policy_number:'ABCDEFG'}
      expect(response).to have_http_status(:success)
    end

    it "Can only edit your items" do
      @vehicle.user_id = 80085
      @vehicle.save
      get :edit, vehicle_id: @vehicle.id, id:insurance.id, insurance:{policy_number:'NEWABC'}
      expect(response).to have_http_status(:redirect)
    end

    it 'doesnt edit' do
      get :edit, vehicle_id: @vehicle.id, id: 60000 , insurance:{policy_number:'NEW'}
      expect(response).to_not have_http_status(:success)
    end

  end

  describe "GET #show" do
    it "returns http success" do
      get :show, vehicle_id: @vehicle.id, id: insurance.id
      expect(response).to have_http_status(:success)
    end
  end

end