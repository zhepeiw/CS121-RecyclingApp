require 'elasticsearch/model'

class City < ApplicationRecord
  # Define associations
  has_many :recycles
  has_many :subcategories, through: :recycles
  has_many :has_facilities
  has_many :facilities, through: :has_facilities
  has_many :city_contacts

  accepts_nested_attributes_for :recycles
  accepts_nested_attributes_for :facilities
  accepts_nested_attributes_for :city_contacts

  # Define uploader
  mount_uploader :image_link, MediaUploader
  mount_uploaders :files, MediaUploader

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

  def self.find_contributor_by_id(city_id)
    city = City.find_by_id(city_id)
    User.find_by_id(city.uid)
  end

  def self.find_category_ids(city_id)
    city = City.find_by_id(city_id)
    categories = []
    city.subcategories.each do |subcategory|
      unless categories.include?(subcategory.category_id)
        categories.push(subcategory.category_id)
      end
    end
    categories

  end
end

unless City.__elasticsearch__.index_exists?
  City.__elasticsearch__.create_index!
  City.import
end
