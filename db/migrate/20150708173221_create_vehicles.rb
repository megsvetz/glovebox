class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :type
      t.string :make
      t.string :model
      t.integer :year
      t.integer :mileage
      t.string :name
      t.string :vin
      t.string :license_plate
      t.string :state

      t.belongs_to :user

      t.boolean :selling, default: false

      t.timestamps null: false
    end
  end
end
