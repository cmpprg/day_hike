class Trip < ApplicationRecord
  validates :name, presence: true

  has_many :trip_trails
  has_many :trails, through: :trip_trails

  def total_trail_distance
    trails.sum(:length)
  end
end
