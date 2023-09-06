class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo, dependent: :destroy
  has_many :compilations, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :followeds, class_name: 'Follow', foreign_key: 'followed_id'
  has_many :followers, class_name: 'Follow', foreign_key: 'follower_id'

  validates :username, presence: true, uniqueness: true, length: { within: (2..16) }

  before_create do
    if self.photo.blank?
      self.photo.attach(io: URI.open("https://dessins-animes-hrd.appspot.com/img/dessins-animes/davidlegnome.jpg"), filename: "avatar", content_type: "image/jpg")
      Cloudinary::Uploader.destroy(self.photo.key)
    end
  end
end

