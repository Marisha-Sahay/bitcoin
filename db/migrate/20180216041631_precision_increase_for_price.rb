class PrecisionIncreaseForPrice < ActiveRecord::Migration[5.0]
  def change
    change_column :prices, :price, :decimal, :precision => 150, :scale => 150
    change_column :prices, :volume24hour, :decimal, :precision => 150, :scale => 150
    change_column :prices, :volume24hourto, :decimal, :precision => 150, :scale => 150
    change_column :prices, :high24hour, :decimal, :precision => 150, :scale => 150
    change_column :prices, :low24hour, :decimal, :precision => 150, :scale => 150
    change_column :prices, :change_percent, :decimal, :precision => 150, :scale => 150
    change_column :prices, :supply, :decimal, :precision => 150, :scale => 150
    change_column :prices, :market_cap, :decimal, :precision => 150, :scale => 150
    change_column :prices, :totalvol24hr, :decimal, :precision => 150, :scale => 150
    change_column :prices, :totalvol24hrto, :decimal, :precision => 150, :scale => 150
  end
end
