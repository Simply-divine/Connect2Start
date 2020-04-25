class Investor < ApplicationRecord
  belongs_to :user
  #  before_save { self.email = email.downcase }
  validates :user_id, presence: true, uniqueness: true
  validates :experience, presence: true
  has_many :investor_categories
  has_many :categories, through: :investor_categories
  # has_secure_password
end
