require 'elasticsearch/model'

class Category < ApplicationRecord
  has_many :subcategories, dependent: :destroy
  has_many :facility_recycles
  has_many :facilities, through: :facility_recycles

  # Search prereq
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  index_name "categories-#{Rails.env}-index"

  def self.search(query)
    __elasticsearch__.search({
       query: {
           multi_match: {
               query: query,
               fields: [ "name^2", "recycle_class"],
               fuzziness: 1
           }
       },
       highlight: {
           pre_tags: ['<mark>'],
           post_tags: ['</mark>'],
           fields: { name: {}, recycle_class: {} }
       },
       suggest: {
           text: query,
           name: {
               term: { size: 1, field: :name }
           },
           recycle_class: {
               term: { size: 1, field: :recycle_class }
           }
       }
   })
  end

  def self.find_subcategories_by_id(category_id)
    category = Category.find_by_id(category_id)
    category.subcategories.where(category_id: category_id)
  end
end

unless Category.__elasticsearch__.index_exists?
  Category.__elasticsearch__.create_index!
  Category.import
end
