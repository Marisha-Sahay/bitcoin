class PagesController < ApplicationController

  def subscribe
    # response = Unirest.get("http://webhose.io/search?token=d8031f4d-87f0-4722-aef6-180d877ebc6d&format=json&q=bitcoin%20cryptocurrency&sort=relevancy").body
    # response = Unirest.get("http://webhose.io/search?token=c015c400-6e3b-4540-a2c0-d643354db3cc&format=json&q=bitcoin%20cryptocurrency&sort=relevancy").body
    # @posts = response['posts'].first(13)
    @posts = News.distinct(:title).order('published DESC, performance_score DESC').limit(13)
    @prices = Unirest.get("https://api.coinmarketcap.com/v1/ticker/?limit=10").body
    @contents = FeaturedContent.all.limit 5
    @videos = Video.all.shuffle[0..22]
    @videos_new = Video.all.shuffle[0..22]
  end
  def subscrib
    @prices = Unirest.get("https://api.coinmarketcap.com/v1/ticker/?limit=10").body
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
  
  def beginner_knowledge_base
    @videos_two = Video.where("length = 2").limit 3
    @videos_five = Video.where("length = 5").limit 3
    @videos_ten = Video.where("length >= 10").limit 3
  end
  
  def trader_investor_lp
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
    @coins = Coin.all.limit 10
    @posts = News.distinct(:title).order('published DESC, performance_score DESC')
  end

  def cafe
    response = Unirest.get("https://newsapi.org/v1/sources?category=technology").body
    @posts = response['sources']
  end
end