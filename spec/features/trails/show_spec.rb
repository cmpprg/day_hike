require "rails_helper"

RSpec.describe "When I visit a trail's show page", type: :feature do
  before(:each) do
    @trail1 = Trail.create(length:43, name:"Western Trail", address: "trail1 address")
    @trail2 = Trail.create(length:21, name:"Easter Trail", address: "trail2 address")
    @trail3 = Trail.create(length:103, name:"Northern Trail", address: "trail3 address")
    @trail4 = Trail.create(length:41, name:"Southern Trail", address: "trail4 address")
    @trail5 = Trail.create(length:12, name:"Christmas Trail", address: "trail5 address")

    @trip1 = Trip.create(name:"Best")
    @trip2 = Trip.create(name:"Worst")
    @trip3 = Trip.create(name:"OK")

    TripTrail.create(trip:@trip1, trail:@trail1)
    TripTrail.create(trip:@trip1, trail:@trail2)
    TripTrail.create(trip:@trip1, trail:@trail3)
    TripTrail.create(trip:@trip2, trail:@trail2)
    TripTrail.create(trip:@trip2, trail:@trail3)
    TripTrail.create(trip:@trip2, trail:@trail4)
    TripTrail.create(trip:@trip3, trail:@trail3)
    TripTrail.create(trip:@trip3, trail:@trail4)
    TripTrail.create(trip:@trip3, trail:@trail5)

    visit "/trails/#{@trail3.id}"
  end
  it "I see the name and address of trail" do
    within(".trail-info") do
      expect(page).to have_content(@trail3.name)
      expect(page).to have_content("Address: #{@trail3.address}")
    end
  end

  it "I see name and total length of every hiking trip that includes this trail " do
    within(".associated-trips") do
      within("#trip-#{@trip1.id}") do
        expect(page).to have_content("1. #{@trip1.name} - Total Length: #{@trip1.total_trail_distance}")
      end
      within("#trip-#{@trip2.id}") do
        expect(page).to have_content("2. #{@trip2.name} - Total Length: #{@trip2.total_trail_distance}")
      end
      within("#trip-#{@trip3.id}") do
        expect(page).to have_content("3. #{@trip3.name} - Total Length: #{@trip3.total_trail_distance}")
      end
    end
  end
end
