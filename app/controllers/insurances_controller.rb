class InsurancesController < ApplicationController
  before_action :find_insurance, only: [:edit, :update, :show]
  before_action :find_vehicle
  before_action :authenticate_user!

  def index
    @insurances = Insurance.where(@vehicles.user_id == current_user.id)
  end

  def new
    @insurance = @vehicle.insurances.build
  end

  def create
    @insurance = @vehicle.insurances.build(insurance_params)
    if @insurance.save
      redirect_to(vehicle_insurance_path(@vehicle.id, @insurance.id))
      flash[:notice] = "Insurance was added successfully!"
    else
      flash[:error] = "Insurance was not added."
      render :new
    end
  end

  def edit
  end

  def update
    if @insurance.update(insurance_params)
      flash[:notice] = "Insurance was successfully updated."
      redirect_to(vehicle_insurance_path(@vehicle.id, @insurance.id))
    else
      flash[:error] = "Insurance was not successfully updated."
      render :edit
    end
  end

  def show
  end

  private

  def insurance_params
    params.require(:insurance).permit(:policy_number, :company, :expiration_date, :cost, :image)
  end

  def find_insurance
    @insurance = Insurance.find_by(id: params[:id])
    unless @insurance
      render(text: "Insurance not found.", status: :not_found)
    end
  end

  def find_vehicle
    @vehicle = Vehicle.find_by(id: params[:vehicle_id])
  end

end