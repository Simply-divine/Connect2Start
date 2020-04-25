class User < ApplicationRecord
  has_many :articles
  has_many :messages, dependent: :destroy
  has_one :investor
  has_one :mentor
  has_one :member
  groupify :named_group_member
  groupify :group_member
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :fname, presence: true, length: {minimum: 3, maximum: 75}
  validates :lname, presence: true, length: {minimum: 3, maximum: 75}
  validates :dob, presence: true
  validates :phone, presence: true
  validates :email, presence: true, length: { maximum: 100 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }

  has_secure_password
end