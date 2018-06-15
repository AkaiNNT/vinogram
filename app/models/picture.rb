class Picture < ApplicationRecord
  belongs_to :imageable , polymorphic: true
  has_attached_file :image , styles: { medium: "300x300#", thumb: "100x100>" }, default_url: "/images/:style/missing.png", 
                                        size: { in: 0..1000.kilobytes },
                                        url: "/system/:hash.:extension",
                                        hash_secret: "abc123"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
