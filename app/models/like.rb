class Like < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :item, presence: true, uniqueness: { scope: :user }
end
