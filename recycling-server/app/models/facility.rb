class Facility < ApplicationRecord
    has_many :facility_recycles
    has_many :categories, through: :facility_recycles
    has_many :has_facilities
    has_many :cities, through: :has_facilities
end
