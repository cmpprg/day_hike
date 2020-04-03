require "rails_helper"

RSpec.describe TripTrail, type: :model do
  describe "relationships" do
    it {should belong_to :trip}
    it {should belong_to :trail}
  end
end
