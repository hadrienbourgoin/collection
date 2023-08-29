class Item < ApplicationRecord
  belongs_to :compilation

  has_many :tags, through: :itemsTags
  has_one_attached :photo, dependent: :destroy
end
