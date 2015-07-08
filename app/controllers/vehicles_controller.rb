class VehiclesController < ApplicationController
  before_action :find_vehicle, only: [:show, :edit, :update, :destory]

  def index
    @vehicles = Vehicle.all
  end

  def show
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
  end

  def destroy
  end

  private
  def vehicle_params
    params.require(:vehicle).permit(:type, :make, :model, :year, :mileage, :name, :vin, :license_plate, :state, :user_id, :image)
  end

  def find_vehicle
    @vehicle = Vehicle.find_by(id: params[:id])
  end

end
