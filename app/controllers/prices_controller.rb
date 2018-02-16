class PricesController < ApplicationController

  def index
    @prices_usd = Price.where(["to_symbol = ?", "USD"])
    @prices_btc = Price.where(["to_symbol = ?", "BTC"])
  end
  def show
    @price = Price.find_by(id: params[:id])
  end

end
