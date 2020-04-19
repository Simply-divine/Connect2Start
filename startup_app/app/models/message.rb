class Message < ApplicationRecord
  belongs_to :room, inverse_of: :message
  belongs_to :user
  validates :body, presence: true
end