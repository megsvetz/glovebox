class CreateInsurances < ActiveRecord::Migration
  def change
    create_table :insurances do |t|
      t.string :policy_number
      t.string :company
      t.string :expiration_date
      t.string :renewal_date
      t.integer :cost

      t.belongs_to :vehicle

      t.timestamps null: false
    end
  end
end
