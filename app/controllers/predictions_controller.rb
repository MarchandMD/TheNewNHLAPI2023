class PredictionsController < ApplicationController
  def index
    user = User.find()
  end

  def home
  end

  private

  def user_params
    params.permit([:user_id])
  end
end
