class CoinsController < ApplicationController
  
  def search
    
  end
  
  def show
    @all_coins = Coin.all.limit 15
    @coinsAll = Coin.all
    @coin = Coin.find_by(id: params[:id])
    @posts = Unirest.get("http://www.bitcoincaffe.com/api/v1/news?filter_key=#{@coin.name}").body
    if @posts.length == 0 
      @posts = Unirest.get("http://www.bitcoincaffe.com/api/v1/news").body
    end
  end

end
