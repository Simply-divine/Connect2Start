class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.datetime :dob
      t.numeric :phone
      t.string  :email
      t.timestamps
    end
  end
end
