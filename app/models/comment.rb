class Comment < ApplicationRecord
  attr_accessor :comment_modal
  belongs_to :user
  belongs_to :post
  validates_presence_of :content
end
