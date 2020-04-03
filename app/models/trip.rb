class Trip < ApplicationRecord
validates :name, presence: true

has_many :trip_trails
has_many :trails, through: :trip_trails
end
