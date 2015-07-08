class AddImageColumnsToRegistrations < ActiveRecord::Migration
  def up
    add_attachment :registrations, :image
  end

  def down
    remove_attachment :registrations, :image
  end
end
