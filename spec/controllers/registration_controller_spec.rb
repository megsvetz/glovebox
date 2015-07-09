require 'rails_helper'

RSpec.describe RegistrationController, type: :controller do
  let(:registration) {FactoryGirl.create(:registration)}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "created successfully" do
      post :create, registration: {state:'California' }
      expect(response).to redirect_to(vehicle_registration_path)
    end

    it "was NOT created" do
     post :create, registration: {state: nil}
     expect(response).to_not have_http_status(:redirect)
     expect(flash[:error]).to be_present
    end
  end

  describe "PUT #update" do
   it "updated successfully!" do
     new_state = "new state"
     put :update, id: vehicle.id, registration: {state: 'new state'}
     expect(response).to have_http_status(:redirect)
     updated_registration = registration.reload
     expect(updated_registration.description).to eq(new_state)
     expect(flash[:notice]).to be_present
   end

   it "did NOT update!" do
     put :update, id: registration.id, registration:{name: nil}
     expect(flash[:error]).to be_present
     expect(response).to render_template(:edit)
   end 
 end

  describe "GET #edit" do
    it "Edits registration" do
      get :edit, id:registration.id, registration:{state:'rNew State'}
      expect(response).to have_http_status(:success)
    end

    it 'doesnt edit' do
      get :edit, id:'1'
      expect(response).to have_http_status(:not_found)
    end

    it "doesnt edit without a state" do
      get :edit, id:registration.id, registration:{name: nil }
      expect(response).to have_http_status(:success)
      expect(registration.reload.state).to_not be_nil
      expect(response).to render_template(:edit)
    end
  end

  describe "DELETE #destroy" do
    it "deletes registration" do
      delete :destroy, id:registration.id 
      expect(registration.count).to eq(0)
    end
  end

  

  describe "GET #show" do
    it "returns http success" do
      get :show, id: registration.id
      expect(response).to have_http_status(:success)
    end
  end

end
