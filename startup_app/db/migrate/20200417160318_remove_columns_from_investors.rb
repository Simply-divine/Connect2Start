class RemoveColumnsFromInvestors < ActiveRecord::Migration[5.2]
  def change
    remove_column :investors, :fname
    remove_column :investors, :lname  
    remove_column :investors, :email
    remove_column :investors, :dob
    remove_column :investors, :phone
    remove_column :investors, :created_at
    remove_column :investors, :updated_at
  end
end
