require "rails_helper"

RSpec.describe "When i visit the hiking trips index page.", type: :feature do
  before(:each) do
    @trip1 = Trip.create(name:"Best")
    @trip2 = Trip.create(name:"Worst")
    @trip3 = Trip.create(name:"OK")
  end

  it "I can see a list of all hiking trip names." do
    visit "/trips"

    within(".list") do
      expect(page).to have_content(@trip1.name)
      expect(page).to have_content(@trip2.name)
      expect(page).to have_content(@trip3.name)
    end
  end

  it "I can click a trip name and be taken to it's show page" do
    visit "/trips"

    within(".list") do
      click_link @trip1.name
    end

    expect(current_path).to eql("/trips/#{@trip1.id}")
  end
end
