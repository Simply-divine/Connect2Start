class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy, inverse_of: chatroom
end