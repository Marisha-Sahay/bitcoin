class LatestNewsController < ApplicationController
  def index
    @news = LatestNews.order(:date_of_news)
    @news_bitcoin = LatestNews.where("lower(category) LIKE ? OR lower(title) LIKE ?", "%bitcoin%", "%bitcoin%").order(:date_of_news).limit 14
    @news_altcoin = LatestNews.where("lower(category) LIKE ? OR lower(title) LIKE ?", "%altcoin%", "%altcoin%").order(:date_of_news)
    @news_blockchain = LatestNews.where("lower(category) LIKE ? OR lower(title) LIKE ?", "%blockchain%", "%blockchain%").order(:date_of_news)
    @news_ico = LatestNews.where("lower(category) LIKE ? OR lower(title) LIKE ?", "%ico%", "%ico%").order(:date_of_news)
  end
end
