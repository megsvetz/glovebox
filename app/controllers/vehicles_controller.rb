class VehiclesController < ApplicationController
  before_action :find_vehicle, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authenticate_user, only: [:show, :edit, :update, :destory]
  before_action :check_membership, only: [:new, :create]
  before_action :validate_vehicle, only: [:show, :edit]


  def index
    @vehicles = current_user.vehicles.all.order("created_at ASC").paginate(:page => params[:page], :per_page => 9)
  end

  def show

    
  end

  def edit
    


  end


  def transfer
    vehicle = Vehicle.find(params[:vehicle])
    sender = User.find_by(id: vehicle.user_id).email
    if vehicle.insurance.present?
      vehicle.insurance.destroy
    end
    if vehicle.registration.present?
      vehicle.registration.destroy
    end
    vehicle.user_id = User.find_by(params[email: :new_owner_email]).id
    receiver = User.find_by(params[email: :new_owner_email]).email
    vehicle.save
    Reminders.vehicle_transfer(receiver, sender, vehicle).deliver
    redirect_to :back
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
      render :new, notice: 'Vehicle not created'
    end

	end

  def update
    @vehicle.update(vehicle_params)
    redirect_to vehicle_path(@vehicle.id), notice: "#{@vehicle.type} was successfully updated."
  end

  def destroy
    @vehicle.destroy
    redirect_to vehicles_path
  end

  def selling
    @vehicles = current_user.vehicles.all.order("created_at ASC")
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
