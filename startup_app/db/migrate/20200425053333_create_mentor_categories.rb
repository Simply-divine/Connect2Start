class CreateMentorCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :mentor_categories do |t|
			t.integer :mentor_id
			t.integer :category_id
    end
  end
end
