class Recycle < ApplicationRecord
  # Define associations
  belongs_to :cities, optional: true
  belongs_to :subcategories, optional: true
end
