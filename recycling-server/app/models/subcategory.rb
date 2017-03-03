class Subcategory < ApplicationRecord
  # Define associations
  has_many :recycles
  has_many :cities, through: :recycles

  belongs_to :categories, optional: true
end
