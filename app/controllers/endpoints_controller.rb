class EndpointsController < ApplicationController
  def index
    @endpoints = Endpoint.all
  end

  def show
    @endpoint = Endpoint.find(params[:id])
  end

  def new
  end

  def create
  end
end
