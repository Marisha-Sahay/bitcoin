class SearchController < ApplicationController
  
 
  def show
    @all_coins = Coin.order(:rank).limit 15
    @coinsAll = Coin.all
    @search = params[:search];
    @coin = Coin.where('name LIKE ?', "%#{params[:search]}%").limit 1
    @posts = Unirest.get("http://www.bitcoincaffe.com/api/v1/news?filter_key=#{@coin.name}").body
    if @posts.length == 0 
      @posts = Unirest.get("http://www.bitcoincaffe.com/api/v1/news").body
    end
  end

end
