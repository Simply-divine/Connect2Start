class RemoveDobFromMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :dob
  end
end
