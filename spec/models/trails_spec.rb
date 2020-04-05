require 'rails_helper'

describe Trail, type: :model do
  describe 'validations' do
    it { should validate_presence_of :length }
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }

    it { should validate_numericality_of(:length).only_integer }
    it { should validate_numericality_of(:length).is_greater_than(0) }
  end

  describe "relationships" do
    it {should have_many :trip_trails}
    it {should have_many(:trips).through(:trip_trails)}
  end

  describe "instance methods" do
    it "can count total number of trips that inlude self" do
      trail3 = Trail.create(length:103, name:"Northern Trail", address: "trail3 address")
      trip1 = Trip.create(name:"Best")
      trip2 = Trip.create(name:"Worst")
      trip3 = Trip.create(name:"OK")
      TripTrail.create(trip:trip1, trail:trail3)
      TripTrail.create(trip:trip2, trail:trail3)
      TripTrail.create(trip:trip3, trail:trail3)

      expect(trail3.trip_count).to eql(3)
    end
  end
end
