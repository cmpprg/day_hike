class TripTrail < ApplicationRecord

  belongs_to :trail
  belongs_to :trip
end
