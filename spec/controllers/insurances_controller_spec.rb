require 'rails_helper'

RSpec.describe InsurancesController, type: :controller do
 login_user

  before(:each) do 
    @vehicle = FactoryGirl.create(:vehicle)
  end

  let(:insurance) {FactoryGirl.create(:insurance)}

  describe "GET #index" do
    it "returns http success" do
      get :index , vehicle_id: @vehicle.id
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET #new" do
    it "returns http success" do
      get :new, insurance_id: @insurance.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "created successfully" do
      post :create, insurance_id: @insurance.id, insurance: {policy_number: 232435}
      expect(response).to have_http_status(:redirect)
    end

    it "was NOT created" do
     post :create, insurance_id: @insurance.id,  insurance: {policy_number: nil}
     expect(response).to_not have_http_status(:redirect)
     expect(flash[:error]).to be_present
    end
  end

  describe "PUT #update" do
   it "updated successfully!" do
     put :update, insurance_id: @insurance.id, id: insurance.id, insurance: {policy_number: 12345}
     expect(response).to have_http_status(:redirect)
     updated_insurance = insurance.reload
     expect(updated_insurance.policy_number).to eq(12345)
     expect(flash[:notice]).to be_present
   end

   it "did NOT update!" do
     put :update, insurance_id: @insurance.id, id: insurance.id, insurance: {policy_number: nil}
     expect(response).to render_template(:edit)
     expect(flash[:error]).to be_present
   end 
 end

  describe "GET #edit" do
    it "Edits insurance" do
      get :edit, insurance_id: @insurance.id, id:insurance.id, insurance:{policy_number: 12345}
      expect(response).to have_http_status(:success)
    end

    it 'doesnt edit' do
      get :edit, insurance_id: @insurance.id, id: 60000 , insurance:{policy_number: 12345}
      expect(response).to_not have_http_status(:success)
    end

  end

  describe "GET #show" do
    it "returns http success" do
      get :show, insurance_id: @insurance.id, id: insurance.id
      expect(response).to have_http_status(:success)
    end
  end

end
