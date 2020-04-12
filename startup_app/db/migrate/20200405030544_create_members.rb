class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :lname
      t.string :fname
      t.numeric :phone
      t.string :email
      t.string :ex_startup_name
      t.string :dob
      t.string :ex_startup_field
    end
  end
end
