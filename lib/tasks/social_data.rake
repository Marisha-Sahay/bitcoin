require "csv"
namespace :import do
  task Coinlist: :environment do
    Coin.delete_all
    response = Unirest.get("https://www.cryptocompare.com/api/data/coinlist/").body
    base_url = "https://www.cryptocompare.com"
    posts = response['Data']
    CSV.foreach("lib/assets/Coinlist.csv", :headers => true) do |row|
      row_hash = row.to_hash
      coin = Coin.new(rank: row_hash["rank"], name: row_hash["name"], symbol: row_hash["symbol"], cryptocompkey: row_hash["cryptocompkey"])
      coin[:image_url] = "#{base_url}" + posts["#{coin[:symbol]}"]["ImageUrl"]
      coin[:coin_url] = "#{base_url}" + posts["#{coin[:symbol]}"]["Url"]
      links = Unirest.get("https://www.cryptocompare.com/api/data/socialstats/?id=#{coin[:cryptocompkey]}").body
        coin[:twitter_link] = links["Data"]["Twitter"]["link"]
        coin[:reddit_link] = links["Data"]["Reddit"]["link"]
        coin[:facebook_link] = links["Data"]["Facebook"]["link"]
      if links["Data"]["CodeRepository"]["List"].length != 0 
        coin[:github_link] = links["Data"]["CodeRepository"]["List"][0]["url"]
      end
      coin.save
    end
  end
end