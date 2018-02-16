namespace :import do
  task prices: :environment do
    Price.delete_all
    coins = Coin.where("rank < 101")
    markets = ["Bitfinex","Poloniex","Kraken","Coinbase","HitBTC","gemini","bittrex"]
    coins.each do |coin|
      markets.each do |market|
        response = Unirest.get("https://min-api.cryptocompare.com/data/pricemultifull?fsyms=#{coin[:symbol]}&tsyms=BTC,USD&e=#{market}").body
        if response["Response"] == "Error"
        else
          btc_data = response["RAW"]["#{coin[:symbol]}"]["BTC"]
          usd_data = response["RAW"]["#{coin[:symbol]}"]["USD"]
          price_db = Price.new(market: btc_data['MARKET'], from_symbol: btc_data['FROMSYMBOL'], to_symbol: btc_data['TOSYMBOL'], price: btc_data['PRICE'] , volume24hour: btc_data['VOLUME24HOUR'], volume24hourto: btc_data['VOLUME24HOURTO'], high24hour: btc_data['HIGH24HOUR'], low24hour: btc_data['LOW24HOUR'], change_percent: btc_data['CHANGEPCT24HOUR'],supply: btc_data['SUPPLY'], market_cap: btc_data['MKTCAP'], totalvol24hr: btc_data['TOTALVOLUME24H'], totalvol24hrto: btc_data['TOTALVOLUME24HTO'],coin_id: "#{coin[:id]}")
          if price_db.save
          else
          end
          price_db = Price.new(market: usd_data['MARKET'], from_symbol: usd_data['FROMSYMBOL'], to_symbol: usd_data['TOSYMBOL'], price: usd_data['PRICE'] , volume24hour: usd_data['VOLUME24HOUR'], volume24hourto: usd_data['VOLUME24HOURTO'], high24hour: usd_data['HIGH24HOUR'], low24hour: usd_data['LOW24HOUR'], change_percent: usd_data['CHANGEPCT24HOUR'],supply: usd_data['SUPPLY'], market_cap: usd_data['MKTCAP'], totalvol24hr: usd_data['TOTALVOLUME24H'], totalvol24hrto: usd_data['TOTALVOLUME24HTO'],coin_id: "#{coin[:id]}")
          if price_db.save
          else
          end
        end
      end
    end
  end
end