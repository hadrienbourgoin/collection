class Item < ApplicationRecord
  belongs_to :compilation

  has_many :items_tag, dependent: :destroy
  has_many :tags, through: :items_tag
  has_one_attached :photo, dependent: :destroy
end
