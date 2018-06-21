class Post < ApplicationRecord
  belongs_to :user
  has_many :pictures, as: :imageable, dependent: :destroy
  has_many :likes,                    dependent: :destroy
  has_many :comments,                 dependent: :destroy

  accepts_nested_attributes_for :pictures, reject_if: :all_blank, allow_destroy: true
  validate :has_pictures?

  has_attached_file :attachment, styles: {
    medium: {geometry: "640x480", format:'mp4', convert_options: {
      input: {},
      output: {
        vcodec: 'libx264',
        movflags: '+faststart',
        strict: :experimental
      }
    }},
    thumb: {geometry: "100x100#", format:'jpg', time: 10}
  }, processors: [:transcoder]
  validates_attachment_content_type :attachment, content_type: /\Avideo\/.*\Z/
  validates_attachment :attachment, size: {less_than: 130.megabytes}


  def has_pictures?
    if (self.pictures.present? && self.attachment.present? )
      errors.add(:base,"Post must has only pictures or video")
    elsif (self.pictures.blank? && self.attachment.blank?)
      errors.add(:base, "Post must has at least one picture or one video.")
    end
  end

end
