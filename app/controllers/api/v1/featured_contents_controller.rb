class Api::V1::FeaturedContentsController < ApplicationController
  def show
    @news = FeaturedContent.find_by(id: params[:id])
    render json: @news
  end
  
  def index
    @news = FeaturedContent.all
    render json:@news
  end
end
