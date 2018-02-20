class PricesController < ApplicationController

  def index 
    @coin = { 'price' => 'USD', 'market' => 'BitTrex' }
    @prices = Price.where(["to_symbol = ? and market = ?", "#{@coin['price']}", "#{@coin['market']}" ])
    # @prices_btc = Price.where(["to_symbol = ? and market = ?", "BTC", "BitTrex"])
  end
  def search 
    @coin = { 'price' => params[:price], 'market' => params[:market] }
    if @coin['price'] == ''
      @coin['price'] = 'USD'
    end
    if @coin['market'] == ''
      @coin['market'] = 'BitTrex'
    end
    
    @prices = Price.where(["to_symbol = ? and market = ?", "#{@coin['price']}", "#{@coin['market']}" ])
    # @prices_btc = Price.where(["to_symbol = ? and market = ?", "BTC", "BitTrex"])
    # render :index
  end
  def show
    @price = Price.find_by(id: params[:id])
  end

end
