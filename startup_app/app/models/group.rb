class Group < ActiveRecord::Base
  groupify :group
  belongs_to :room
end
