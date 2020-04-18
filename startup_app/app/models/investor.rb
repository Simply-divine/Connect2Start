class Investor < ApplicationRecord
  belongs_to :user
  #  before_save { self.email = email.downcase }
  validates :user_id, presence: true, uniqueness: true
  validates :field, presence: true
  validates :experience, presence: true
  # has_secure_password
end