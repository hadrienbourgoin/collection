class Tag < ApplicationRecord
  has_many :items, through: :itemsTags
end
