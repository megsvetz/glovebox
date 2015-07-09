class RepairsController < ApplicationController
	before_action :set_repair_type
  before_action :set_vehicle
	before_action :set_repair, only: [:show, :edit, :update, :destroy]

	def index
		# @repairs = @vehicle.oilchanges
		@repairs = @vehicle.repairs.send(repair_type)
	end

	def show
	end

	def edit
	end

	def update
		if @repair.update(repair_params)
		  redirect_to @repair, notice: "#{type} was successfully updated."
		else
		  render action: 'edit'
		end
	end

	def destroy
		@repair.destroy
		redirect_to vehicle_repairs_path(@vehicle.id)
	end

	def new
		@repair = @vehicle.repairs.build
	end

	def create
		@repair = @vehicle.repairs.build(repair_params)
    if @repair.save
      redirect_to vehicle_repairs_path(@vehicle.id), notice: "#{@type} was successfully created."
    else
      render action: 'new'
    end
	end

	private
    def set_vehicle
      @vehicle = Vehicle.find_by(id: params[:vehicle_id])
		end

	   def set_repair
	     @repair = repair_type_class.find_by(id: params[:id])
	   end

	  def set_repair_type
      @type = type()
    end

    def type()
      Repair.types.include?(params[:type]) ? params[:type] : "All"
    end

    def repair_type
			if type == "All"
      	type.downcase
			else
				type.pluralize
			end
    end

    def repair_params
      params.require(type.underscore.to_sym).permit(:type, :repair_description, :repair_date, :repair_cost, :repair_image, :repair_place)
    end
end
