class Trip < ApplicationRecord
  validates :name, presence: true

  has_many :trip_trails
  has_many :trails, through: :trip_trails

  def total_trail_distance
    trails.sum(:length)
  end

  def average_trail_distance
    return 0.0 if trails.empty?
    trails.average(:length)
  end

  def longest_trail
    trails.order(:length).last
  end

  def shortest_trail
    trails.order(:length).first
  end

end
