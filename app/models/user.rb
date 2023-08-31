class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo, dependent: :destroy
  has_many :compilations, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: { within: (2..16) }
end
