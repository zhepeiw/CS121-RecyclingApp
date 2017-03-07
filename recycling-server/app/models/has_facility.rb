class HasFacility < ApplicationRecord
  # Define associations
  belongs_to :facilities, optional: true
  belongs_to :cities, optional: true
end
