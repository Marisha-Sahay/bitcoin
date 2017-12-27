namespace :import do
  task coins: :environment do
    response = Unirest.get("https://www.cryptocompare.com/api/data/coinlist/").body
    base_url = "https://www.cryptocompare.com"
    posts = response['Data']
    coins = ["BTC","ETH","BCH","XRP","LTC","ADA","IOT","DASH","XEM","XMR","EOS","BTG","NEO","QTUM","XLM","ETC","LSK","XVG","TRON","ZEC"]
    reddits = ["https://www.reddit.com/r/bitcoin","https://www.reddit.com/r/ethereum","https://www.reddit.com/r/Bitcoincash","https://www.reddit.com/r/ripple","https://www.reddit.com/r/litecoin","https://www.reddit.com/r/cardano","https://www.reddit.com/r/Iota","https://www.reddit.com/r/dashpay","https://www.reddit.com/r/nem","https://www.reddit.com/r/monero","NA","NA","https://www.reddit.com/r/NEO","https://www.reddit.com/r/Qtum","https://www.reddit.com/r/stellar","https://www.reddit.com/r/EthereumClassic","https://www.reddit.com/r/lisk","https://www.reddit.com/r/vergecurrency","https://www.reddit.com/r/Tronix","NA"]
    tweets = ["https://twitter.com/bitcoin","https://twitter.com/ethereumproject","NA","https://twitter.com/Ripple","https://twitter.com/LitecoinProject","https://twitter.com/CardanoStiftung","https://twitter.com/iotatoken","https://twitter.com/Dashpay","https://twitter.com/NEMofficial","https://twitter.com/monerocurrency","https://twitter.com/eos_io","https://twitter.com/bitcoingold","https://twitter.com/neo_blockchain","https://twitter.com/qtumOfficial","https://twitter.com/StellarOrg","https://twitter.com/eth_classic","https://twitter.com/LiskHQ","https://twitter.com/vergecurrency","https://twitter.com/tronfoundation","https://twitter.com/zcashco"]
    i = 0
    coins.each do |coin|
      news = Coin.new(name: posts["#{coin}"]["CoinName"], symbol: "#{coin}", coin_url: "#{base_url}" + posts["#{coin}"]["Url"], image_url: "#{base_url}" + posts["#{coin}"]["ImageUrl"], TotalCoinSupply: posts["#{coin}"]["TotalCoinSupply"], reddit_link: reddits[i], twitter_link: tweets[i])
      if news.save
        i += 1
      else

      end
    end
  end
end