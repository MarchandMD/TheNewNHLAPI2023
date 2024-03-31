require "rails_helper"

RSpec.describe "TeamsFacade" do
  describe ".all_teams" do
    it "returns an Array of teams", :vcr do
      all_teams = TeamsFacade.all_teams

      all_teams.each do |team|
        expect(team).to be_a Team
      end
    end
  end

  describe ".get_roster" do
    it "returns an Array of Players", :vcr do
      roster = TeamsFacade.get_roster(tri_code: "CHI")

      expect(roster).to be_a Hash
    end
  end
end
