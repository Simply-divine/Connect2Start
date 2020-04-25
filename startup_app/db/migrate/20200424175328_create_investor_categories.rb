class CreateInvestorCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :investor_categories do |t|
			t.integer :investor_id
			t.integer :category_id
    end
  end
end
