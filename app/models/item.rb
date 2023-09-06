class Item < ApplicationRecord
  belongs_to :compilation

  has_many :items_tag, dependent: :destroy
  has_many :tags, through: :items_tag
  has_one_attached :photo, dependent: :destroy

  before_destroy :delete_photo

  private

  def delete_photo
    photo.purge
  end
  
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
