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
    it "can calculate total distance of all trails." do
      trip1 = Trip.create(name:"Best")

      trail1 = Trail.create(length:43, name:"Western Trail", address: "trail1 address")
      trail2 = Trail.create(length:21, name:"Easter Trail", address: "trail2 address")
      trail3 = Trail.create(length:103, name:"Northern Trail", address: "trail3 address")

      TripTrail.create(trip:trip1, trail:trail1)
      TripTrail.create(trip:trip1, trail:trail2)
      TripTrail.create(trip:trip1, trail:trail3)

      expect(trip1.total_trail_distance).to eql(167)
    end

    it "can calculate average distance of all trails, 0.0 if no trails." do
      trip1 = Trip.create(name:"Best")

      trail1 = Trail.create(length:43, name:"Western Trail", address: "trail1 address")
      trail2 = Trail.create(length:21, name:"Easter Trail", address: "trail2 address")
      trail3 = Trail.create(length:103, name:"Northern Trail", address: "trail3 address")

      expect(trip1.average_trail_distance.round(1)).to eql(0.0)

      TripTrail.create(trip:trip1, trail:trail1)
      TripTrail.create(trip:trip1, trail:trail2)
      TripTrail.create(trip:trip1, trail:trail3)

      expect(trip1.average_trail_distance.round(1)).to eql(55.7)
    end

    it "can find the longest trail on trip." do
      trip1 = Trip.create(name:"Best")

      trail1 = Trail.create(length:100, name:"Western Trail", address: "trail1 address")
      trail2 = Trail.create(length:500, name:"Easter Trail", address: "trail2 address")
      trail4 = Trail.create(length:300, name:"Easter Trail", address: "trail2 address")
      trail3 = Trail.create(length:200, name:"Northern Trail", address: "trail3 address")

      TripTrail.create(trip:trip1, trail:trail1)
      TripTrail.create(trip:trip1, trail:trail2)
      TripTrail.create(trip:trip1, trail:trail3)
      TripTrail.create(trip:trip1, trail:trail4)

      expect(trip1.longest_trail).to eql(trail2)
    end

    it "can find the shortest trail on the trip" do
      trip1 = Trip.create(name:"Best")

      trail2 = Trail.create(length:500, name:"Easter Trail", address: "trail2 address")
      trail4 = Trail.create(length:300, name:"Easter Trail", address: "trail2 address")
      trail1 = Trail.create(length:100, name:"Western Trail", address: "trail1 address")
      trail3 = Trail.create(length:200, name:"Northern Trail", address: "trail3 address")

      TripTrail.create(trip:trip1, trail:trail1)
      TripTrail.create(trip:trip1, trail:trail2)
      TripTrail.create(trip:trip1, trail:trail3)
      TripTrail.create(trip:trip1, trail:trail4)

      expect(trip1.shortest_trail).to eql(trail1)
    end
  end
end
