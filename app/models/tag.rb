class Tag < ApplicationRecord
  has_many :items_tag, dependent: :destroy
  has_many :items, through: :items_Tag
end
