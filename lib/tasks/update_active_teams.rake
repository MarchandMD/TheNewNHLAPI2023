namespace :update_active_teams do
  desc "updates teams that are active"
  task teams: :environment do
    active_teams = ["New York Rangers",
      "Dallas Stars",
      "Carolina Hurricanes",
      "Boston Bruins",
      "Vancouver Canucks",
      "Colorado Avalanche",
      "Florida Panthers",
      "Winnipeg Jets",
      "Edmonton Oilers",
      "Toronto Maple Leafs",
      "Nashville Predators",
      "Vegas Golden Knights",
      "Tampa Bay Lightning",
      "Los Angeles Kings",
      "St. Louis Blues",
      "Philadelphia Flyers",
      "Washington Capitals",
      "Minnesota Wild",
      "Detroit Red Wings",
      "New York Islanders",
      "New Jersey Devils",
      "Buffalo Sabres",
      "Pittsburgh Penguins",
      "Seattle Kraken",
      "Calgary Flames",
      "Ottawa Senators",
      "Montréal Canadiens",
      "Arizona Coyotes",
      "Columbus Blue Jackets",
      "Anaheim Ducks",
      "Chicago Blackhawks",
      "San Jose Sharks"]

    all_teams = Team.all

    all_teams.each do |team|
      unless active_teams.include? team.full_name
        team.update(active: false)
      end
    end
  end
end
