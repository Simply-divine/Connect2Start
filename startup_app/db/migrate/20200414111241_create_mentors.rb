class CreateMentors < ActiveRecord::Migration[5.2]
  def change
    create_table :mentors do |t|
      t.string :fname
      t.string :lname
      t.datetime :dob
      t.numeric :phone
      t.string :email
      t.timestamps
      t.string :password_digest
    end
  end
end
