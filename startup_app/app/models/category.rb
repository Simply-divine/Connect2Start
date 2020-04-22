class Category < ApplicationRecord
    validates :name, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 3,maximum: 50}
    has_many :mentors
    has_many :investors
    has_many :article_categories
    has_many :articles, through: :article_categories
end
