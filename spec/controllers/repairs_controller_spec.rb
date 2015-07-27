require 'rails_helper'

RSpec.describe RepairsController, type: :controller do

  before(:each) do
    @user = FactoryGirl.create(:user)
    @vehicle = FactoryGirl.create(:vehicle, user: @user)
    sign_in @user
  end

  let(:repair) {FactoryGirl.create(:repair, vehicle: @vehicle)}

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
      post :create, vehicle_id: @vehicle.id, repair: {repair_description:'replaced bearing', repair_date:Faker::Date.between(2.days.ago, Date.today), repair_cost: 2000, type: "Oilchange" }
      expect(response).to have_http_status(:redirect)
    end
    it "won't create with nil type" do
      post :create, vehicle_id: @vehicle.id, repair: {repair_description:'replaced bearing', repair_date:Faker::Date.between(2.days.ago, Date.today), repair_cost: 2000, type: nil}
      expect(response).to render_template(:new)
    end
  end

  describe "PUT #update" do
   it "updated successfully!" do
     put :update, vehicle_id: @vehicle.id, id: repair.id, repair: {repair_description: "new repair description"}
     expect(response).to have_http_status(:redirect)
     expect(repair.reload.repair_description).to eq("new repair description")
     expect(flash[:notice]).to be_present
   end
   it "does not update with nil type" do
     put :update, vehicle_id: @vehicle.id, id: repair.id, repair: {type: nil}
     expect(response).to render_template(:edit)
   end
  end

  describe "GET #edit" do
    it "Edits Repairs" do
      get :edit, vehicle_id: @vehicle.id, id:repair.id, repair:{type:'New repair type'}
      expect(response).to have_http_status(:success)
    end

    it "Can only edit your repair" do
      @vehicle.user_id = 80085
      @vehicle.save
      get :edit, vehicle_id: @vehicle.id, id:repair.id, repair:{tyoe:'New repair type'}
      expect(response).to have_http_status(:redirect)
    end

    it 'doesnt edit' do
      get :edit, vehicle_id: @vehicle.id, id: 60000 , repair:{type:'New repair type'}
      expect(response).to_not have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, vehicle_id: @vehicle.id, id: repair.id
      expect(response).to have_http_status(:success)
    end
  end

end


