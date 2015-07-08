class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :state
      t.date :expiration
      t.integer :cost

      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
