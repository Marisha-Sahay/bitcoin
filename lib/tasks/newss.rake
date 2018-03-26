namespace :import do
  task news: :environment do
    require 'rss'
    require 'open-uri'
    # LatestNews.delete_all

    # CCN NEWS
    rss_results = []
    rss = RSS::Parser.parse(open("https://www.ccn.com/feed/").read, false).items[0..50]
    rss.each do |result|
      result = { title: result.title, date: result.pubDate, link: result.link, description: result.description, category: result.category.content }
      rss_results.push(result)
    end
    rss_results.each do|res|
      news = LatestNews.find_or_initialize_by(title: res[:title])
      news[:news_url] = res[:link]
      news[:category] = res[:category]
      news[:date_of_news] = res[:date]
      news[:description] = res[:description].split("<p>The post <a")[0]
      if news.save
      else
      end
    end

    # cryptocurrencynews
    rss_results = []
    rss = RSS::Parser.parse(open("https://cryptocurrencynews.com/feed/").read, false).items[0..50]
    rss.each do |result|
      result = { title: result.title, date: result.pubDate, link: result.link, description: result.description, category: result.category.content }
      rss_results.push(result)
    end
    rss_results.each do|res|
      news = LatestNews.find_or_initialize_by(title: res[:title])
      news[:news_url] = res[:link]
      news[:category] = res[:category]
      news[:date_of_news] = res[:date]
      desc = res[:description].split("Read The Full Article On CryptoCurrencyNews.com")
      des = desc[0].split("</div>")
      d = des[1].split('<div class="mh-excerpt"><p></p>')
      de = d[1].split("</p>")
      news[:description] = de[0][4..-1]
      if news.save
      else
      end
    end

    # Coindesk News
    rss_results = []
    rss = RSS::Parser.parse(open("https://www.coindesk.com/feed/").read, false).items[0..50]
    rss.each do |result|
      result = { title: result.title, date: result.pubDate, link: result.link, description: result.description, category: result.category.content }
      rss_results.push(result)
    end
    rss_results.each do|res|
      news = LatestNews.find_or_initialize_by(title: res[:title])
      news[:news_url] = res[:link]
      news[:category] = res[:category]
      news[:date_of_news] = res[:date]
      news[:description] = res[:description]
      if news.save
      else
      end
    end

    # cointelegraph news
    rss_results = []
    rss = RSS::Parser.parse(open("https://cointelegraph.com/rss").read, false).items[0..5000]
    rss.each do |result|
      result = { title: result.title, date: result.pubDate, link: result.link, description: result.description, category: result.category.content }
      rss_results.push(result)
    end
    rss_results.each do|res|
      news = LatestNews.find_or_initialize_by(title: res[:title])
      news[:news_url] = res[:link]
      news[:category] = res[:category]
      news[:date_of_news] = res[:date]
      arr = res[:description].split('"')
      a = arr[2].split("#")
      news[:description] = a[0][4..-1]
      if news.save
      else
      end
    end
  end
end