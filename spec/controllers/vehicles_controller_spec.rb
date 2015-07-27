require 'rails_helper'

RSpec.describe VehiclesController, type: :controller do

  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  let(:vehicle){ FactoryGirl.create(:vehicle, user: @user )}

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
    it "redirects If basic Memebership and too many cars" do
      4.times {|v| FactoryGirl.create(:vehicle, user: @user)}
      get :new
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "POST #create" do
    it "does create" do
      post :create, vehicle: {type:''}
      expect(response).to have_http_status(:redirect)
      expect(Vehicle.all.count).to eq(1)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: vehicle.id
      expect(response).to have_http_status(:success)
    end

    it "doesn't edit" do
      vehicle.user_id = 80085
      vehicle.save
      get :edit, id:  vehicle.id
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "PUT update" do
    it "does update" do
      put :update, id: vehicle.id, vehicle: {name: 'Updated vehicle Name'}
      expect(vehicle.reload.name).to eq('Updated vehicle Name')
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: vehicle.id
      expect(response).to have_http_status(:success)
    end
    it "if Basic user can only see 3 vehicles" do
      4.times {|v| @auto = FactoryGirl.create(:vehicle, user: @user)}
      get :show, id: @auto.id
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "DELETE destroy" do
    it "does delete the list" do
      delete :destroy, id: vehicle.id
      expect(response).to have_http_status(:redirect)
    end
  end

end
