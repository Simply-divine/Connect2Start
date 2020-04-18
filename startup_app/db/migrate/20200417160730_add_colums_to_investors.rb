class AddColumsToInvestors < ActiveRecord::Migration[5.2]
  def change
    add_column :investors, :field, :string
    add_column :investors, :experience, :integer
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
