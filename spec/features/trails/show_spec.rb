require "rails_helper"

RSpec.describe "When I visit a trail's show page", type: :feature do
  before(:each) do
    @trail3 = Trail.create(length:103, name:"Northern Trail", address: "trail3 address")
    @trip1 = Trip.create(name:"Best")
    @trip2 = Trip.create(name:"Worst")
    @trip3 = Trip.create(name:"OK")
    TripTrail.create(trip:@trip1, trail:@trail3)
    TripTrail.create(trip:@trip2, trail:@trail3)
    TripTrail.create(trip:@trip3, trail:@trail3)

    visit "/trails/#{@trail3.id}"
  end
  it "I see the name and address of trail" do
    within(".trail-info") do
      expect(page).to have_content(@trail3.name)
      expect(page).to have_content("Address: #{@trail3.address}")
    end
  end
end
