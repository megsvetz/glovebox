class RegistrationsController < ApplicationController
  before_action :find_registration, only: [:edit, :update, :show]
  before_action :find_vehicle
  before_action :authenticate_user!
  before_action :authenticate_user, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.premium?
      @vehicles = current_user.vehicles.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 9)
    else
      @vehicles = [current_user.vehicles.second, current_user.vehicles.third, current_user.vehicles.first]
    end
  end

  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(registration_params)
    @registration.save
    redirect_to(vehicle_registration_path(@registration.vehicle_id, @registration.id))
    flash[:notice] = "Registration was added successfully!"
  end

  def edit
  end

  def update
    @registration.update(registration_params)
    flash[:notice] = "Registration was successfully updated."
    redirect_to(vehicle_registration_path(@vehicle.id, @registration.id))
  end

  def show
    if params[:layout] == 'false'
      render('show', layout: false)
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:state, :expiration, :cost, :image, :vehicle_id)
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

  def authenticate_user
    if @vehicle.user_id != current_user.id || @vehicle.registration.id != params[:id].to_i
      redirect_to vehicles_path
    end
  end

end
