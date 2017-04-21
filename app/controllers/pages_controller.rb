class PagesController < ApplicationController

  def news_index
    response = Unirest.get("http://webhose.io/search?token=c015c400-6e3b-4540-a2c0-d643354db3cc&format=json&q=bitcoin%20cryptocurrency&sort=relevancy").body
    @posts = response['posts'].first(6)
  end

  def till_now
    @response = Unirest.get("https://api.blockchain.info/stats?&cors=true").body
  end

  def home
  end
  
  def news_show
  end

  def hotshots
  end

  def resources
  end
  
  def abc_news
    response = Unirest.get("http://webhose.io/search?token=c015c400-6e3b-4540-a2c0-d643354db3cc&format=json&q=bitcoin%20cryptocurrency&sort=relevancy").body
    @posts = response['posts'].first(3)
  end
  def cafe
    response = Unirest.get("https://newsapi.org/v1/sources?category=technology").body
    @posts = response['sources']
  end
end