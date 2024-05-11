namespace :get_players do
  desc "retrieves players and assigns them to teams"
  task teams: :environment do
    all_teams = TeamsFacade.all_teams

    all_teams.each do |team|
      roster = TeamsFacade.get_roster(tri_code: team.tri_code)
      roster.each do |k, v|
        v.each do |player|
          Player.create!(id: player[:id], name: player[:firstName][:default] + " " + player[:lastName][:default],
            position: player[:positionCode], number: player[:sweaterNumber], team_id: team.id)
        end
      end
    end
  end
end
