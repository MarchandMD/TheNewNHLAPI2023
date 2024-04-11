namespace :populate_conference_and_division do
  desc "populate conference and division field for active teams"
  task teams: :environment do
    standings = HTTParty.get("https://api-web.nhle.com/v1/standings/now")
    standings = JSON.parse(standings.body, symbolize_names: true)

    standings[:standings].each do |standings_data|
      team = Team.find_by(full_name: standings_data[:teamName][:default])
      if team.active
        team.update(conference_name: standings_data[:conferenceName],
          division_name: standings_data[:divisionName])
      end
    end
  end
end
