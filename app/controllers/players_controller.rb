class PlayersController < ApplicationController
  def index
  end

  def show
    response = RestClient.get("https://api-web.nhle.com/v1/player/#{params[:id]}/landing")

    player = JSON.parse(response.body, symbolize_names: true)

    @player = Player.new(player)
  end
end
