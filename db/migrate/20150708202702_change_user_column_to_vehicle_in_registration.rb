class ChangeUserColumnToVehicleInRegistration < ActiveRecord::Migration
  def change
    remove_column :registrations, :user_id

    add_column :registrations, :vehicle_id, :integer
  end
end
