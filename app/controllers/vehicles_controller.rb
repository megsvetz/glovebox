class VehiclesController < ApplicationController
  before_action :find_vehicle, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authenticate_user, only: [:show, :edit, :update, :destory]
  before_action :check_membership, only: [:new, :create]
  before_action :validate_vehicle, only: [:show, :edit]


  def index
    @vehicles = current_user.vehicles.all.order("created_at ASC").paginate(:page => params[:page], :per_page => 9)
  end

  def for_sale
    @vehicles = Vehicle.where(selling: true)
  end

  def show
    # if current_user.basic?
  end

  def edit
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    # @vehicle.image = "/assets/default_car.jpg"
    if @vehicle.save
      redirect_to vehicles_path, notice: "#{@vehicle.type} was successfully created."
    else
      render action: 'new'
    end
	end

  def update
    if @vehicle.update(vehicle_params)
      redirect_to vehicle_path(@vehicle.id), notice: "#{@vehicle.type} was successfully updated."
    else
      render action: 'new'
    end
  end

  def destroy
    @vehicle.destroy
    redirect_to vehicles_path
  end

  private
  def find_type
    Vehicle.type.include?(params[:type]) ? params[:type] : "Vehicle"
  end

  def vehicle_params
    params.require(find_type.underscore.to_sym).permit(:type, :make, :model, :year, :mileage, :name, :vin, :license_plate, :state, :user_id, :image)
  end

  def find_vehicle
    @vehicle = Vehicle.find_by(id: params[:id])
  end

  def authenticate_user
    if @vehicle.user_id != current_user.id
      redirect_to vehicles_path
    end
  end

  def check_membership
    if current_user.basic? && current_user.vehicles.count >= 3
      redirect_to new_charge_path, notice: "Members with the basic plan are only allowed 3 cars"
    end
  end

  def validate_vehicle
    @vehicles = current_user.vehicles.all.order("created_at ASC")
    if current_user.basic? && @vehicles.length > 3
      @vehicles = [current_user.vehicles.second, current_user.vehicles.third, current_user.vehicles.first]
    end
    bool = @vehicles.any? {|vehicle| @vehicle == vehicle }
    if bool == false
      redirect_to new_charge_path
    end
  end
end
