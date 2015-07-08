class ChangeSomeColumnsFromStringToDate < ActiveRecord::Migration
  def change
    remove_column :insurances, :expiration_date
    remove_column :insurances, :renewal_date

    add_column :insurances, :expiration_date, :date
    add_column :insurances, :renewal_date, :date
  end
end
