class ChangeVehicleDefaultValues < ActiveRecord::Migration
  def change

    change_column :vehicles, :type, :string, default: 'car'
    change_column :vehicles, :make, :string, default: 'make'
    change_column :vehicles, :model, :string, default: 'model'
    change_column :vehicles, :name, :string, default: 'vehicle'

  end
end
