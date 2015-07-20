class RemoveAllDefaults < ActiveRecord::Migration
  def change
    change_column_default(:vehicles, :make, nil)
    change_column_default(:vehicles, :model, nil)
    change_column_default(:vehicles, :name, nil)
    change_column_default(:vehicles, :type, nil)
  end
end
