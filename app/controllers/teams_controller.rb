class TeamsController < ApplicationController
  def index
    @all_teams = NhlService.all_teams
  end

  def show
    @team = NhlService.team(team_params[:id])
  end

  private

  def team_params
    params.permit(:id)
  end
end
