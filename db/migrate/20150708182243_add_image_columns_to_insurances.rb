class AddImageColumnsToInsurances < ActiveRecord::Migration
  def up
    add_attachment :insurances, :image
  end

  def down
    remove_attachment :insurances, :image
  end
end
