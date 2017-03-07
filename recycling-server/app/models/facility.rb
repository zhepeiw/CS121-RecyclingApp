class Facility < ApplicationRecord
    has_many :categories, through: :facility_recycles
    has_many :cities, through: :has_facilities
end
