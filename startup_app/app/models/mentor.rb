class Mentor < ApplicationRecord
  belongs_to :user
  #  before_save { self.email = email.downcase }
  validates :user_id, presence: true, uniqueness: true
  validates :experience, presence: true
  has_many :mentor_categories
  has_many :categories, through: :mentor_categories
  # has_secure_password
end
