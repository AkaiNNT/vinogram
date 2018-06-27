class Comment < ApplicationRecord
  attr_accessor :comment_modal
  belongs_to :user
  belongs_to :post
  validates_presence_of :content
  extend FriendlyId
  friendly_id :content, use: [:slugged, :finders]
  def slug_candidates
    [
      :content,
      [:content, :id],
      [:content, :id, :created_at]
    ]
  end
end
