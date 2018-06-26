class Following < ApplicationRecord
  belongs_to :follower, :class_name => 'User'
  belongs_to :following, :class_name => 'User'
    enum status: {following: 1, pending: 0}
end
