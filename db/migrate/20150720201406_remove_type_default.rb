class RemoveTypeDefault < ActiveRecord::Migration
  def change
    remove_column :vehicles, :type
    add_column :vehicles, :type, :string, default: 'Car'
  end
end
