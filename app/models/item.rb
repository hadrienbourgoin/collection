class Item < ApplicationRecord
  belongs_to :compilation

  has_many :items_tag
  has_many :tags, through: :items_tag
  has_one_attached :photo, dependent: :destroy

  include AlgoliaSearch

  algoliasearch do
    attributes :name, :description
    searchableAttributes ['name', 'description']
  end

end
