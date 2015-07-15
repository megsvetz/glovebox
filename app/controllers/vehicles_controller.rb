class VehiclesController < ApplicationController
  before_action :find_vehicle, only: [:show, :edit, :update, :destroy]

  def index
    @vehicles = current_user.vehicles.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 9)
  end

  def show
  end

  def edit
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.save
      redirect_to vehicles_path, notice: "#{@vehicle.type} was successfully created."
    else
      render action: 'new'
    end
	end

  def update
    if @vehicle.update(vehicle_params)
      redirect_to vehicles_path, notice: "#{@vehicle.type} was successfully updated."
    else
      render action: 'new'
    end
  end

  def destroy
    @vehicle.destroy
    redirect_to vehicles_path
  end

  private
  def vehicle_params
    params.require(:vehicle).permit(:type, :make, :model, :year, :mileage, :name, :vin, :license_plate, :state, :user_id, :image)
  end

  def find_vehicle
    @vehicle = Vehicle.find_by(id: params[:id])
  end

end
