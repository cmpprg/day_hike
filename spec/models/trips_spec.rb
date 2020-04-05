require "rails_helper"

RSpec.describe Trip, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :trip_trails}
    it {should have_many(:trails).through(:trip_trails)}
  end

  describe "instance methods" do
    it "can calculate total distance of all trails" do
      trip1 = Trip.create(name:"Best")

      trail1 = Trail.create(length:43, name:"Western Trail", address: "trail1 address")
      trail2 = Trail.create(length:21, name:"Easter Trail", address: "trail2 address")
      trail3 = Trail.create(length:103, name:"Northern Trail", address: "trail3 address")

      TripTrail.create(trip:trip1, trail:trail1)
      TripTrail.create(trip:trip1, trail:trail2)
      TripTrail.create(trip:trip1, trail:trail3)

      expect(trip1.total_trail_distance).to eql(167)
    end
  end
end
