class RemoveNameEmailFromMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :fname
    remove_column :members, :lname
    remove_column :members, :email
    
  end
end
