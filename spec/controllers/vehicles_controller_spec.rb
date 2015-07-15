require 'rails_helper'

RSpec.describe VehiclesController, type: :controller do
  let(:vehicle){ FactoryGirl.create(:vehicle)} 
  let(:user){ FactoryGirl.create(:user) }

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
    it "does create" do 
      post :create, vehicle: {type:''}
      expect(response).to have_http_status(:redirect)
      expect(vehicle.all.count).to eq(1)
    end

    it "doesn't create" do
      post :create, vehicle: {type: nil}
      expect(vehicle.all.count).to eq(0)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: vehicle.id
      expect(response).to have_http_status(:success)
    end

    it "doesn't edit" do
      get :edit, id: 1
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "PUT update" do
    it "does update" do
      put :update, id: vehicle.id, vehicle: {type: 'Updated vehicle Type'}
      expect(vehicle.type).to eq('Updated vehicle type')
    end

    it "doesn't update" do
      put :update, id: vehicle.id, vehicle: {vehicle: nil}
      expect(flash[:error]).to be_present
      expect(response).to render_template(:edit)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: vehicle.id
      expect(response).to have_http_status(:success)
    end

    it "doesn't edit" do
      get :show, id: 1
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "DELETE destroy" do 
    it "does delete the list" do
      delete :destroy, id: vehicle.id
      expect(responce).to have_http_status(:success)
    end

    it "doesn't delete the list" do
      delete :destroy, id: vehicle.id
      expect(response).to have_http_status(:redirect)
    end
  end

end
