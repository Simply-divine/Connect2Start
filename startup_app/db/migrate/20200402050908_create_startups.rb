class CreateStartups < ActiveRecord::Migration[5.2]
  def change
    create_table :startups do |t|
      t.string :org_name
      t.string :contact_name
      t.string :org_email
      t.numeric :cur_emps
      t.numeric :phone
      t.string :description
    end
  end
end
