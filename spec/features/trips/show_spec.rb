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

  it "I can see name, address, and length for each trail on trip." do
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

  it "I see the total hiking distance of all trails on trip." do
    within(".stats") do
      expect(page).to have_content("Total Distance of All Trails: #{@trail1.length + @trail2.length + @trail3.length}")
    end
  end

  it "I see an average hiking distance of all trails on trip." do
    within(".stats") do
      expect(page).to have_content("Average Distance of all trails: #{((@trail1.length + @trail2.length + @trail3.length) / @trip1.trails.count.to_f).round(1)}")
    end
  end

  it "I see a heading that says 'Longest Trail on Trip' and the name and length of longest trails" do
    within(".longest-trail") do
      expect(page).to have_content("Longest Trail on Trip:")
      expect(page).to have_content("#{@trail3.name} - #{@trail3.length} miles")
    end
  end

  it "I see a heading that says 'Shortest Trail on Trip' and the name and length of longest trails" do
    within(".shortest-trail") do
      expect(page).to have_content("Shortest Trail on Trip:")
      expect(page).to have_content("#{@trail2.name} - #{@trail2.length} miles")
    end
  end

  it "I can click on the name of a trail and be taken to that trails show page." do
    within("#trail-#{@trail2.id}") do
      click_link(@trail2.name)
    end

    expect(current_path).to eql("/trails/#{@trail2.id}")

    visit "/trips/#{@trip1.id}"
    
    within(".longest-trail") do
      click_link(@trail3.name)
    end

    expect(current_path).to eql("/trails/#{@trail3.id}")

    visit "/trips/#{@trip1.id}"

    within(".shortest-trail") do
      click_link(@trail2.name)
    end

    expect(current_path).to eql("/trails/#{@trail2.id}")
  end
end
