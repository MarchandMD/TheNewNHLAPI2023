class NhlService
  include HTTParty
  base_uri "https://api-web.nhle.com/v1/"

  def initialize(service, page)
    @options = {query: {site: service, page: page}}
  end

  def self.get_endpoint(endpoint:)
    HTTParty.get(base_uri + endpoint)
  end
end
