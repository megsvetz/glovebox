class AddCitytoUser < ActiveRecord::Migration
  def change
    add_column :users, :city, :text
    add_column :users, :state, :string
  end
end
