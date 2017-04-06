require 'elasticsearch/model'

class City < ApplicationRecord
  # Define associations
  has_many :recycles
  has_many :subcategories, through: :recycles
  has_many :has_facilities
  has_many :facilities, through: :has_facilities

  accepts_nested_attributes_for :recycles
  accepts_nested_attributes_for :facilities

  # Search prereq
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  index_name "cities-#{Rails.env}-index"

  def self.search(query)
    __elasticsearch__.search({
        query: {
            multi_match: {
                query: query,
                fields: [ "name^3", "zipcode"],
                fuzziness: 2
            }
        },
        highlight: {
            pre_tags: ['<mark>'],
            post_tags: ['</mark>'],
            fields: { name: {}, zipcode: {} }
        },
        suggest: {
            text: query,
            name: {
                term: { size: 1, field: :name }
            },
            zipcode: {
                term: { size: 1, field: :zipcode }
            }
        }
    })
  end

  def self.find_subcategories_by_id(city_id, category_id)
    city = City.find_by_id(city_id)
    city.subcategories.where(category_id: category_id)
  end

  def self.find_facilities_by_city(city_id)
    city = City.find_by_id(city_id)
    city.facilities.all
  end
end

unless City.__elasticsearch__.index_exists?
  City.__elasticsearch__.create_index!
  City.import
end
