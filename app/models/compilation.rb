class Compilation < ApplicationRecord
  has_many :items
  belongs_to :user
  has_many :items, dependent: :destroy
end
