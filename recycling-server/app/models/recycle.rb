class Recycle < ApplicationRecord
  # Define associations
  belongs_to :city
  belongs_to :subcategory
end
