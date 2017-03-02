class City < ApplicationRecord
  # Define associations
  has_many :recycles
  has_many :subcategories, through: :recycles

  def find_city_by_id(id)
    Recycle
        .joins(:city, :subcategory)
        .where(cities: { id: id })
        .take
  end
end
