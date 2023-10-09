class EndpointsController < ApplicationController
  def index
    @endpoints = Endpoint.all.sort_by(&:path)
  end

  def show
    @endpoint = Endpoint.find(params[:id])
    response = NhlService.get_endpoint(endpoint: @endpoint.path)
    @response = JSON.parse(response.body)
  end

  def new
  end

  def create
    @new_endpoint = Endpoint.find_or_initialize_by(path: params[:path])

    if @new_endpoint.save
      redirect_to root_path
    end
  end
end
