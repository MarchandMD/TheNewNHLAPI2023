class SchedulesController < ApplicationController
  def index
    if params.include? :game_date
      day_schedule = NhlService.get_day_schedule(date: params[:game_date])
      @day_schedule = JSON.parse(day_schedule.body, symbolize_names: true)
    elsif params.include? :full_name
      team = Team.find_by(full_name: params["full_name"])
      team_schedule = NhlService.get_club_schedule_season_now(triCode: team.abbreviation)
      @team_schedule = JSON.parse(team_schedule.body, symbolize_names: true)
    end
    @active_teams = Team.active
  end
end
