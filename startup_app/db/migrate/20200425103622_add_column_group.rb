class AddColumnGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :room_id, :integer
    remove_column :groups, :type
  end
end
