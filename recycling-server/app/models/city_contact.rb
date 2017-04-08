class CityContact < ApplicationRecord
  belongs_to :city, optional: true
end
