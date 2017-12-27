class AddColumnsToCoins < ActiveRecord::Migration[5.0]
  def change
    add_column :coins, :reddit_link, :string
    add_column :coins, :twitter_link, :string
  end
end
