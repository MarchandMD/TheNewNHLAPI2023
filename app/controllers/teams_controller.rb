class TeamsController < ApplicationController
  def index
    @all_teams = TeamsFacade.all_teams
  end

  def show
    @team = Team.find(params[:id])
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
