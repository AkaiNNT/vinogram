class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, :through => :likes, :source => :post
  has_many :followers, class_name: "Following", foreign_key: 'following_id', dependent: :destroy
  has_many :followings, class_name: "Following", foreign_key: 'follower_id', dependent: :destroy
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/users/default_images.jpeg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :contact_number,
  :numericality => true,
  :length => { :minimum => 10, :maximum => 15 },
  :allow_nil => true
  validates :full_name, :presence => true
  validates :full_name, :length => { :minimum => 3 },if: -> { self.full_name.present? }
  enum status: {privacy: 0, pub: 1}

end
