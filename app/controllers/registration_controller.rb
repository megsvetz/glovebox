class RegistrationController < ApplicationController
  before_action :find_registration, only: [:edit, :update, :show]
  before_action :find_vehicle
  before_action :authenticate_user!

  def index
    @registrations = Registration.where(@vehicle.user_id == current_user.id)
  end

  def new
    @registration = @vehicle.registrations.build
  end

  def create
    @registration = @vehicle.registrations.build(registration_params)
    if @registration.save
      redirect_to(vehicle_registration_path(@vehicle.id, @registration.id))
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
      redirect_to(vehicle_registration_path(@vehicle.id, @registration.id))
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
    @vehicle = Vehicle.find_by(id: params[:vehicle_id])
  end

end
