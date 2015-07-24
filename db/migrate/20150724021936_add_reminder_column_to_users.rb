class AddReminderColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :reminder, :boolean, default: false
  end
end
