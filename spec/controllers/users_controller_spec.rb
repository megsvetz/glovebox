require 'rails_helper'

RSpec.describe UsersController, type: :controller do
#   let(:user){ FactoryGirl.create(:user) }

#   describe "GET #index" do
#     it "returns http success" do
#       get :index
#       expect(response).to have_http_status(:success)
#     end
#   end

#   describe "GET #new" do
#     it "returns http success" do
#       get :new
#       expect(response).to have_http_status(:success)
#     end
#   end

#   describe "POST #create" do
#     it "does create the list" do 
#       post :create, user: {user_title: 'Glovebox'}
#       expect(response).to have_http_status(:redirect)
#       expect(List.all.count).to eq(1)
#     end

#     it "doesn't create" do
#       post :create, list: {list_title: nil}
#       expect(List.all.count).to eq(0)
#     end
#   end

#   describe "GET #edit" do
#     it "edits the list" do
#       get :edit, id: list.id
#       expect(response).to have_http_status(:success)
#     end

#     it "doesn't edit" do
#       get :edit, id: 1
#       expect(response).to have_http_status(:not_found)
#     end
#   end

#   describe "PUT update" do
#     it "does update" do
#       put :update, id: list.id, list: {list_title: 'Updated List Title'}
#       expect(List.all.reload.first.list_title).to eq('Updated List Title')
#   end

#     it "doesn't update" do
#       put :update, id: list.id, list: {list_title: nil}
#       expect(flash[:error]).to be_present
#       expect(response).to render_template(:edit)
#     end
#   end

#   describe "GET #show" do
#     it "shows the list" do
#       get :show, id: list.id
#       expect(response).to have_http_status(:success)
#     end

#     it "doesn't show" do
#       get :show, id: 5498
#       expect(response).to have_http_status(:not_found)
#     end
#   end

#   describe "DELETE destroy" do 
#     it "does delete the list" do
#       delete :destroy, id: list.id
#       expect(List.all.count).to eq(0)
#     end

#     it "doesn't delete the list" do
#       delete :destroy, id: list.id
#       expect(response).to have_http_status(:redirect)
#     end
#   end

# end

# end
