require "rails_helper"

describe NhlService do
  describe "all_teams" do
    let(:response) { NhlService.all_teams }
    it "returns correctly some data", :vcr do
      expect(response.code).to be(200)
      expect(response.body).to be_a String
    end
  end

  describe ".get_roster" do
    let(:response) { NhlService.get_roster(tri_code: "CHI") }
    it "returns correctly some data of rosters", :vcr do
      expect(response.code).to be(200)
      expect(response.body).to be_a String
    end
  end
end
