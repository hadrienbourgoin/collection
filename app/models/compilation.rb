class Compilation < ApplicationRecord
  has_many :items, dependent: :destroy
  belongs_to :user

  before_destroy :delete_items_photo

  private

  def delete_items_photo
    items.each do |item|
      item.photo.purge
    end
  end
end
