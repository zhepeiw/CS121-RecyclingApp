class City < ApplicationRecord
  # Define associations
  has_many :recycles
  has_many :subcategories, through: :recycles
  has_and_belongs_to_many :facilities, optional: true

  def self.find_subcategories_by_id(city_id, category_id)
    city = City.find_by_id(city_id)
    city.subcategories.where(category_id: category_id)
  end
end
