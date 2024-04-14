require 'rails_helper'

RSpec.describe "PredictionHomes", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/prediction_home/index"
      expect(response).to have_http_status(:success)
    end
  end

end
