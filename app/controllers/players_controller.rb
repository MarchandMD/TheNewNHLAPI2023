class PlayersController < ApplicationController
  def index
    mcjesus = 8478402

    response = HTTParty.get("https://api-web.nhle.com/v1/player/#{mcjesus}/landing")

    @player = response["playerId"]
  end

  def show
    @player = Player.find(params[:id])
  end
end
