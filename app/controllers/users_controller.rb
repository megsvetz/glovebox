class UsersController < ApplicationController

  def create
    if file = params[:file]
      User.delay.create_by_csv(file)
      flash[:notice] = "Users are being uploaded!"
    else
      flash[:error] = "Please provide a users csv file."
    end
    redirect_to root_path
  end
end
