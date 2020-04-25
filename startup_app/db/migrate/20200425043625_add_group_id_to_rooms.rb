class AddGroupIdToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :group_id, :integer, presence: true
  end
end
