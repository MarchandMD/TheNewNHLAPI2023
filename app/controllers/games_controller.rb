class GamesController < ApplicationController
  def index
    response = RestClient.get("https://api-web.nhle.com/v1/schedule/now")
    @games = JSON.parse(response.body, symbolize_names: true)
    @todays_games = todays_games(@games)
  end

  def show
  end

  private

  def todays_games(games_data)
    # there is no Game active model yet
    # games_data[:gameWeek].map { |game_data| Game.new(game_data) }
    games_data
  end
end
