class Post < ApplicationRecord
  belongs_to :user
  has_many :pictures, as: :imageable, dependent: :destroy
  has_many :likes,                    dependent: :destroy

  accepts_nested_attributes_for :pictures, reject_if: :all_blank, allow_destroy: true

  validate :has_pictures?

  def has_pictures?
    errors.add(:base, "Post must have at least one picture.") if self.pictures.blank?
  end

end
