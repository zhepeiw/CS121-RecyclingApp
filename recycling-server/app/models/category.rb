class Category < ApplicationRecord
  has_many :subcategories, dependent: :destroy
  has_many :facilities, through: :facility_recycles
end
