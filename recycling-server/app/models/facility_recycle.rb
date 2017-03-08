class FacilityRecycle < ApplicationRecord
  belongs_to :facility
  belongs_to :category
end
