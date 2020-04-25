class CreateMemberCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :member_categories do |t|
			t.integer :member_id
			t.integer :category_id
    end
  end
end
