class Api::V1::NewsController < ApplicationController

  def show
    @news = News.find_by(id: params[:id])
    render json: @news
  end
  
  def index
    @news = News.all
    render json:@news
  end

end