class Post < ApplicationRecord
  attr_accessor :img_reader, :video_reader
  before_update :callback_parse_params
  after_update_commit :callback_attachment

  belongs_to :user
  has_many :pictures, as: :imageable, dependent: :destroy
  has_many :likes,                    dependent: :destroy
  has_many :liking_users, :through => :likes, :source => :user
  has_many :comments,                 dependent: :destroy

  accepts_nested_attributes_for :pictures, reject_if: :all_blank, allow_destroy: true
  validate :has_content?, :on => :create

  has_attached_file :attachment, styles: {
    medium: {geometry: "640x480", format:'mp4', convert_options: {
      input: {},
      output: {
        vcodec: 'libx264',
        movflags: '+faststart',
        strict: :experimental
      }
    }},
    thumb: {geometry: "500x500#", format:'jpg', time: 1}
  }, processors: [:transcoder]
  validates_attachment_content_type :attachment, content_type: /\Avideo\/.*\Z/
  validates_attachment :attachment, size: {less_than: 130.megabytes}
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]
  def slug_candidates
    [
      :content,
      [:content, :id],
      [:content, :id, :created_at]
    ]
  end

  def has_content?

    if (self.pictures.present? && self.attachment.present? )
      errors.add(:base,"Post must has only pictures or video")
    elsif (!self.pictures.present? && !self.attachment.present? )
      errors.add(:base, "Post must has at least one picture or one video.")
    end

  end

  def callback_parse_params
    if self.img_reader == "true"
      self.attachment = nil if self.pictures.present?
    end
  end

  def callback_attachment
    if self.video_reader == "true"
      self.pictures.destroy_all if self.attachment.present?
    end

    if (!self.pictures.present? && !self.attachment.present? )
      errors.add(:base, "Post must has at least one picture or one video.")
    end
  end

end
