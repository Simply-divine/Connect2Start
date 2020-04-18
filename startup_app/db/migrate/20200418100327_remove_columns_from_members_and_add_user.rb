class RemoveColumnsFromMembersAndAddUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :org_email
    remove_column :members, :phone
    remove_column :members, :created_at
    remove_column :members, :updated_at
    add_column :members, :field, :string
    add_column :members, :experience, :integer
    add_column :members, :user_id, :integer
        #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
