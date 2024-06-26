class NhlService
  include HTTParty
  base_uri "https://api-web.nhle.com/v1"

  def initialize(service, page)
    @options = {query: {site: service, page: page}}
  end

  def self.get_endpoint(endpoint:)
    HTTParty.get(base_uri + endpoint)
  end

  def self.get_day_schedule(date:)
    HTTParty.get(base_uri + "/schedule/#{date}")
  end

  def self.get_club_schedule_season_now(triCode:)
    HTTParty.get(base_uri + "/club-schedule-season/#{triCode}/now")
  end

  def self.all_franchises
    HTTParty.get("https://api.nhle.com/stats/rest/en/franchise?sort=fullName&include=teams")["data"]
  end

  def self.all_teams
    HTTParty.get("https://api.nhle.com/stats/rest/en/team")
  end

  def self.get_roster(tri_code:)
    HTTParty.get("https://api-web.nhle.com/v1/roster/#{tri_code}/current")
  end
end
