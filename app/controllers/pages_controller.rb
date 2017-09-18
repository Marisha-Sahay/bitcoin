class PagesController < ApplicationController

  def subscribe
    response = Unirest.get("http://webhose.io/search?token=d8031f4d-87f0-4722-aef6-180d877ebc6d&format=json&q=bitcoin%20cryptocurrency&sort=relevancy").body
    @posts = response['posts'].first(13)
  end

  def news_index
    response = Unirest.get("http://webhose.io/search?token=c015c400-6e3b-4540-a2c0-d643354db3cc&format=json&q=bitcoin%20cryptocurrency&sort=relevancy").body
    @posts = response['posts'].first(20)
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
    @posts = response['posts']
  end
  def news
    response = Unirest.get("http://webhose.io/search?token=d8031f4d-87f0-4722-aef6-180d877ebc6d&format=json&q=bitcoin%20cryptocurrency&sort=relevancy").body
    @posts = response['posts']
  end
  def cafe
    response = Unirest.get("https://newsapi.org/v1/sources?category=technology").body
    @posts = response['sources']
  end
end