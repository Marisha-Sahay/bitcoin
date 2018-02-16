class CreatePrices < ActiveRecord::Migration[5.0]
  def change
    create_table :prices do |t|
      t.string :market
      t.string :from_symbol
      t.string :to_symbol
      t.decimal :price, precision: 15, scale: 10
      t.decimal :volume24hour, precision: 15, scale: 10
      t.decimal :volume24hourto, precision: 15, scale: 10
      t.decimal :high24hour, precision: 15, scale: 10
      t.decimal :low24hour, precision: 15, scale: 10
      t.decimal :change_percent, precision: 15, scale: 10
      t.decimal :supply, precision: 15, scale: 10
      t.decimal :market_cap, precision: 15, scale: 10
      t.decimal :totalvol24hr, precision: 15, scale: 10
      t.decimal :totalvol24hrto, precision: 15, scale: 10
      t.timestamps
    end
  end
end
