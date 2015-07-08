class RegistrationController < ApplicationController
  before_action :find_registration, only: [:edit, :update, :show]
  before_action :find_vehicle
  before_action :authenticate_user!

  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(registration_params)
    if @registration.save
      redirect_to(vehicle_registration_path(:vehicle_id, :id))
      flash[:notice] = "Registration was added successfully!"
    else
      flash[:error]="Registration was not added."
      render :new
    end
  end

  def edit
  end

  def update
    if @registration.update(registration_params)
      flash[:notice] = "Registration was successfully updated."
      redirect_to(vehicle_registration_path(:vehicle_id, :id))
    else
      flash[:error] = "Registration was not successfully updated."
      render :edit
    end
  end

  def show
  end

  private

  def registration_params
    params.require(:registration).permit(:state, :expiration, :cost, :image)
  end

  def find_registration
    @registration = Registration.find_by(id: params[:id])
    unless @registration
      render(text: "Registration not found.", status: :not_found)
    end
  end

  def find_vehicle
    @vehicle = Vehicle.find(params[:vehicle_id])
  end

end


