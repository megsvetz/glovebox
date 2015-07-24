class AddMileageToRepair < ActiveRecord::Migration
  def change
    add_column :repairs, :mileage, :integer
  end
end
