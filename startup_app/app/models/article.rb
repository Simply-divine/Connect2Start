class Article < ApplicationRecord
    belongs_to :user
    validates :title, presence: true, length: {minimum:3, maximum:30}
    validates :description, presence: true, length: {minimum:5, maximum: 1300}
    validates :user_id,presence: true
    has_many :article_categories
    has_many :categories, through: :article_categories
end