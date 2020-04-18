class RemoveFieldsFrom < ActiveRecord::Migration[5.2]
  def change
    remove_column :mentors , :fname
    remove_column :mentors, :lname  
    remove_column :mentors, :email
    remove_column :mentors, :dob
    remove_column :mentors, :phone
    remove_column :mentors, :created_at
    remove_column :mentors, :updated_at
    add_column :mentors, :field, :string
    add_column :mentors, :experience, :integer
  end
end
