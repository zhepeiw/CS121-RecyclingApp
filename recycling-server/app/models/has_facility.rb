class HasFacility < ApplicationRecord
  # Define associations
  belongs_to :facility
  belongs_to :city
end
