class TeamsFacade
  def self.all_teams
    response = NhlService.all_teams

    all_teams = JSON.parse(response.body, symbolize_names: true)

    all_teams[:data].each do |team|
      Team.find_or_create_by(id: team[:id], full_name: team[:fullName], tri_code: team[:triCode])
    end

    Team.where(active: true).order(:full_name)
  end

  def self.get_roster(tri_code:)
    roster = NhlService.get_roster(tri_code:)

    JSON.parse(roster.body, symbolize_names: true)
  end
end
