class TeamsController < ApplicationController
  def index
    response = RestClient.get("https://api-web.nhle.com/v1/standings/now")
    @all_teams = JSON.parse(response.body, symbolize_names: true)
  end

  def show
    roster = RestClient.get("https://api-web.nhle.com/v1/roster/#{params[:id]}/current")
    roster_data = JSON.parse(roster.body, symbolize_names: true)

    @roster = roster_data[:forwards].map { |player| Player.new(player) }
    @roster_defense = roster_data[:defensemen].map { |player| Player.new(player) }
    @roster_goalies = roster_data[:goalies].map { |player| Player.new(player) }
  end

  def organizational_display_of_teams
    @all_teams = TeamsFacade.all_teams

    if params[:display] == "conferences"
      respond_to do |format|
        format.turbo_stream
      end
    end
  end
end
