class AddPasswordDigestToStartups < ActiveRecord::Migration[5.2]
  def change
    add_column :startups, :password_digest, :string
  end
end
