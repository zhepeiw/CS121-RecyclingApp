require 'elasticsearch/model'

class Subcategory < ApplicationRecord
  # Define associations
  has_many :recycles
  has_many :cities, through: :recycles

  belongs_to :category

  # Search prereq
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  index_name "subcategories-#{Rails.env}-index"

  def self.search(query)
    __elasticsearch__.search({
       query: {
           multi_match: {
               query: query,
               fields: [ "name^2" ],
               fuzziness: 1
           }
       },
       highlight: {
           pre_tags: ['<mark>'],
           post_tags: ['</mark>'],
           fields: { name: {}, category_id: {} }
       },
       suggest: {
           text: query,
           name: {
               term: { size: 1, field: :name }
           },
           category_id: {
               term: { size: 1, field: :category_id }
           }
       }
   })
  end

end

unless Subcategory.__elasticsearch__.index_exists?
  Subcategory.__elasticsearch__.create_index!
  Subcategory.import
end
