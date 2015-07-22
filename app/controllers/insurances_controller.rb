class InsurancesController < ApplicationController
  before_action :find_insurance, only: [:edit, :update, :show]
  before_action :find_vehicle
  before_action :authenticate_user!
  before_action :authenticate_user, only: [:destroy, :edit, :update, :show]

  def index
    if current_user.premium?
      @vehicles = current_user.vehicles.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 9)
    else
      @vehicles = current_user.vehicles.all.take(3)
    end
    #@insurance = Insurance.where(@insurance.vehicle.user_id == current_user.id)
  end

  def new
    @insurance = Insurance.new
  end

  def create
    @insurance = Insurance.new(insurance_params)
    if @insurance.save
      redirect_to(vehicle_insurance_path(@insurance.vehicle_id, @insurance.id))
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
    if params[:layout] == 'false'
      render('show', layout: false)
    end
  end

  private
  def insurance_params
    params.require(:insurance).permit(:policy_number, :company, :expiration_date, :cost, :image, :vehicle_id, :renewal_date)
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

  def authenticate_user
    if @vehicle.user_id != current_user.id || @vehicle.insurance.id != params[:id].to_i
      redirect_to vehicles_path
    end
  end

end
