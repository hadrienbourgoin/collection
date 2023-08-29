class ItemsTag < ApplicationRecord
  belongs_to :item
  belongs_to :tag

  validates :tag, presence: true
  validates :item, presence: true, uniqueness: { scope: :tag }
end
