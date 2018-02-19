class PricesController < ApplicationController

  def index 
    @prices = Price.where(["to_symbol = ? and market = ?", "USD", "BitTrex"])
    # @prices_btc = Price.where(["to_symbol = ? and market = ?", "BTC", "BitTrex"])
  end
  def search 
    price = params[:price];
    market = params[:market];
    if price == ''
      price = 'USD'
    end
    if market == ''
      price = 'BitTrex'
    end
    @prices = Price.where(["to_symbol = ? and market = ?", "#{price}", "#{market}"])
    # @prices_btc = Price.where(["to_symbol = ? and market = ?", "BTC", "BitTrex"])
    render :index
  end
  def show
    @price      = Price.find_by(id: params[:id])
  end

end
