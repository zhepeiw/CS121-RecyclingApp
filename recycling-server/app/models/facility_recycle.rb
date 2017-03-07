class FacilityRecycle < ApplicationRecord
  belongs_to :facilities, optional: true
  belongs_to :categories, optional: true
end
