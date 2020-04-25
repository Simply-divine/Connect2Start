class RemoveColumnsFromInvestorsMentorsStartups < ActiveRecord::Migration[5.2]
  def change
		remove_column :investors, :field
		remove_column :mentors, :field
		remove_column :members, :field
  end
end
