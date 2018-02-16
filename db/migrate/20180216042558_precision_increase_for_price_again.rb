class PrecisionIncreaseForPriceAgain < ActiveRecord::Migration[5.0]
  def change
    change_column :prices, :price, :decimal, :precision => 100, :scale => 50
    change_column :prices, :volume24hour, :decimal, :precision => 100, :scale => 50
    change_column :prices, :volume24hourto, :decimal, :precision => 100, :scale => 50
    change_column :prices, :high24hour, :decimal, :precision => 100, :scale => 50
    change_column :prices, :low24hour, :decimal, :precision => 100, :scale => 50
    change_column :prices, :change_percent, :decimal, :precision => 100, :scale => 50
    change_column :prices, :supply, :decimal, :precision => 100, :scale => 50
    change_column :prices, :market_cap, :decimal, :precision => 100, :scale => 50
    change_column :prices, :totalvol24hr, :decimal, :precision => 100, :scale => 50
    change_column :prices, :totalvol24hrto, :decimal, :precision => 100, :scale => 50
  end
end
