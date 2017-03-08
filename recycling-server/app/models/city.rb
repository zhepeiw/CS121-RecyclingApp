class City < ApplicationRecord
  # Define associations
  has_many :recycles
  has_many :subcategories, through: :recycles
  has_many :facilities, through: :has_facilities

  def self.find_subcategories_by_id(city_id, category_id)
    city = City.find_by_id(city_id)
    city.subcategories.where(category_id: category_id)
  end
end
