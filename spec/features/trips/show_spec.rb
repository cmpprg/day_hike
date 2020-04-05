require "rails_helper"

RSpec.describe "When I visit a trips show page.", type: :feature do
  before(:each) do
    @trip1 = Trip.create(name:"Best")

    @trail1 = Trail.create(length:43, name:"Western Trail", address: "trail1 address")
    @trail2 = Trail.create(length:21, name:"Easter Trail", address: "trail2 address")
    @trail3 = Trail.create(length:103, name:"Northern Trail", address: "trail3 address")

    TripTrail.create(trip:@trip1, trail:@trail1)
    TripTrail.create(trip:@trip1, trail:@trail2)
    TripTrail.create(trip:@trip1, trail:@trail3)

    visit "/trips/#{@trip1.id}"
  end
  it "I can see name, address, and length for each trail." do
    within("#trail-#{@trail1.id}") do
      expect(page).to have_content("Name: #{@trail1.name}")
      expect(page).to have_content("Address: #{@trail1.address}")
      expect(page).to have_content("Length: #{@trail1.length}")
    end
    within("#trail-#{@trail2.id}") do
      expect(page).to have_content("Name: #{@trail2.name}")
      expect(page).to have_content("Address: #{@trail2.address}")
      expect(page).to have_content("Length: #{@trail2.length}")
    end
    within("#trail-#{@trail3.id}") do
      expect(page).to have_content("Name: #{@trail3.name}")
      expect(page).to have_content("Address: #{@trail3.address}")
      expect(page).to have_content("Length: #{@trail3.length}")
    end
  end
end
