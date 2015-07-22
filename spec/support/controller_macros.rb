module ControllerMacros
  def devise_setup
     allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => :user})
     allow(controller).to receive(:current_user).and_return(nil)
 end

 def sign_in(user)
   if user.nil?
     allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => :user})
     allow(controller).to receive(:current_user).and_return(nil)
   else
     allow(request.env['warden']).to receive(:authenticate!).and_return(user)
     allow(controller).to receive(:current_user).and_return(user)
   end
 end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      sign_in user
      user
    end
  end
end
