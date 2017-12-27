class CreateCoins < ActiveRecord::Migration[5.0]
  def change
    create_table :coins do |t|
      t.string :name
      t.string :symbol
      t.string :coin_url
      t.string :image_url
      t.string :TotalCoinSupply

      t.timestamps
    end
  end
end
