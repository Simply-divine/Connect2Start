class AddTimestampsToStartupAndMember < ActiveRecord::Migration[5.2]
  def change
    add_column :startups, :created_at, :datetime
    add_column :startups, :updated_at, :datetime

    add_column :members, :created_at, :datetime
    add_column :members, :updated_at, :datetime

  end
end
