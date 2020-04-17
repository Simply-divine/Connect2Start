class Chatroom < ApplicationRecord
  has_many :message, dependent: :destroy, inverse_of: chatroom
end