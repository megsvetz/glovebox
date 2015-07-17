class AddUpgradeDateToUser < ActiveRecord::Migration
  def change
    add_column :users, :upgrade_date, :date
  end
end
