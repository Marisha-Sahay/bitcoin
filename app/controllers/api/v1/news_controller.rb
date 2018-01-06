class Api::V1::NewsController < ApplicationController

  def show
    @news = News.find_by(id: params[:id])
    render json: @news
  end
  
  def index
    if (params[:filter_key])
      @news = News.where("lower(title) LIKE ? OR lower(description) LIKE ?", "%#{params[:filter_key].downcase}%", "%#{params[:filter_key].downcase}%")
    else
      @news = News.all
    end
    render json:@news
  end

end