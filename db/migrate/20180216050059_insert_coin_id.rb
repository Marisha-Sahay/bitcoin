class InsertCoinId < ActiveRecord::Migration[5.0]
  def change
    add_column :prices, :coin_id, :integer
  end
end
