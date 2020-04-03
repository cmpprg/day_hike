require "rails_helper"

RSpec.describe Trip, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :trip_trails}
    it {should have_many(:trails).through(:trip_trails)}
  end
end
