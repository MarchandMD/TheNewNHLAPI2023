class TeamsController < ApplicationController
  def index
    @all_teams = NhlService.all_teams
  end

  def show
    @team = NhlService.team(team_params[:id])
    @team_name = Team.find_by(abbreviation: params[:id])
  end

  private

  def team_params
    params.permit(:id)
  end
end
