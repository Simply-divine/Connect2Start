class Category < ApplicationRecord
    validates :name, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 3,maximum: 50}
    has_many :mentors
    has_many :investor_categories
    has_many :investors, through: :investor_categories
    has_many :article_categories
    has_many :articles, through: :article_categories
    has_many :mentor_categories
    has_many :mentors, through: :mentor_categories
    has_many :member_categories
    has_many :members, through: :member_categories
end
