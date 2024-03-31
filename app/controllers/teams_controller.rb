class TeamsController < ApplicationController
  def index
    @all_teams = TeamsFacade.all_teams
  end

  def show
    @team = Team.find(params[:id])
  end
end
