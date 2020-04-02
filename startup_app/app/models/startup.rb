class Startup < ApplicationRecord

  before_save { self.org_email = org_email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :org_name, presence: true, length: {minimum: 1, maximum: 75}
  validates :contact_name, presence: true, length: {minimum: 3, maximum: 75}
  validates :description, presence: true
  validates :cur_emps, presence: true
  validates :phone, presence: true,  phone: true
  validates :org_email, presence: true, length: { maximum: 100 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }

end