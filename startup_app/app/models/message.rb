class Message < ApplicationRecord
  belongs_to :chatroom, inverse_of: :message
  belongs_to :user
  validates :body, presence: true
end