class RemoveFieldFromMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :field
  end
end
