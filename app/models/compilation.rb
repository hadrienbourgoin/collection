class Compilation < ApplicationRecord
  has_many :items
  belongs_to :user
  has_many :items, dependent: :destroy


  include AlgoliaSearch

  algoliasearch do
    attribute :user do
      { username: user.username }
    end
    attribute :items do
      items.map do |item|
        { name: item.name, description: item.description }
      end
    end
    attributes :name, :description
    searchableAttributes ['name', 'description']
  end

end
