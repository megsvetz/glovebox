class CreateRepairs < ActiveRecord::Migration
  def change
    create_table :repairs do |t|
      t.string :type
      t.text :repair_description
      t.date :repair_date
      t.decimal :repair_cost, precision: 6, scale: 2
      t.attachment :repair_image
      t.string :repair_place
      t.belongs_to :vehicle
      t.timestamps null: false
    end
  end
end
