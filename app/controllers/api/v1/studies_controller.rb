class Api::V1::StudiesController < ApplicationController
  
  def show
    @resource = ResourceCategory.find_by(id: params[:id])
    render json: @resource
  end
  
  def index
    @resources = ResourceCategory.all
    render json:@resources
  end
  
end
