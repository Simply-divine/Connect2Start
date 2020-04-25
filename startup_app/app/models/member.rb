class Member < ApplicationRecord
  belongs_to :user
  #  before_save { self.email = email.downcase }
  validates :user_id, presence: true, uniqueness: true
  validates :experience, presence: true
  validates :ex_startup_name, presence: true
  has_many :categories 
  # has_secure_password
end
