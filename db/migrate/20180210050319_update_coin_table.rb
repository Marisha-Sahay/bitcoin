class UpdateCoinTable < ActiveRecord::Migration[5.0]
  def change
    add_column :coins, :rank, :integer
    add_column :coins, :cryptocompkey, :integer
    add_column :coins, :facebook_link, :string
    add_column :coins, :github_link, :string
    remove_column :coins, :TotalCoinSupply, :string
  end
end
