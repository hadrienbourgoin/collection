class Tag < ApplicationRecord
  has_many :items_tag
  has_many :items, through: :items_tag

  include AlgoliaSearch

  algoliasearch do
    attributes :word
    searchableAttributes ['word']
  end

end
