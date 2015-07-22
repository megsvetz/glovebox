class ChangeCostTypeOnInsReg < ActiveRecord::Migration
  def change
    remove_column :insurances, :cost
    add_column :insurances, :cost, :decimal
    remove_column :registrations, :cost
    add_column :registrations, :cost, :decimal
  end
end
