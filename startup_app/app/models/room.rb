class Room < ApplicationRecord
  has_many :message, dependent: :destroy, inverse_of: :room
end