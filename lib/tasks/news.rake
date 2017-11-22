namespace :import do
  task data: :environment do
    News.delete_all
    response = Unirest.get("http://webhose.io/filterWebContent?token=d8031f4d-87f0-4722-aef6-180d877ebc6d&format=json&ts=1510461629654&sort=crawled&q=(title%3A%22Bitcoin%22%20OR%20title%3A%22CryptoCurrency%22%20OR%20title%3A%22Etheruem%22%20OR%20title%3A%22Litecoin%22%20OR%20title%3A%22Ripple%22%20OR%20title%3A%22Monero%22%20OR%20title%3A%22Dash%22%20OR%20title%3A%22NEO%22%20OR%20title%3A%22Blockchain%22%20OR%20title%3A%22Decentralization%22%20OR%20title%3A%22Dapp%22%20OR%20title%3A%22Stellar%22%20OR%20title%3A%22ICO%22%20OR%20title%3A%22Token%22%20)%20(site%3A%22cnn.com%22%20OR%20site%3A%22cnbc.com%22%20OR%20site%3A%22bloomberg.com%22%20OR%20site%3A%22forbes.com%22%20OR%20site%3A%22businessinsider.com%22%20OR%20site%3A%22fortune.com%22%20OR%20site%3A%22time.com%22%20OR%20site%3A%22bbc.com%22%20OR%20site%3A%22investors.com%22%20OR%20site%3A%22investopedia.com%22%20OR%20site%3A%22medium.com%22%20OR%20site%3A%22coindesk.com%22%20OR%20site%3A%22cointelegraph.com%22%20OR%20site%3A%22bitcoinmagazine.com%22%20OR%20site%3A%22qz.com%22%20OR%20site%3A%22salon.com%22%20OR%20site%3A%22theonion.com%22%20OR%20site%3A%22reuters.com%22%20OR%20site%3A%22techcrunch.com%22%20OR%20site%3A%22thehackernews.com%22%20OR%20site%3A%22mashable.com%22%20OR%20site%3A%22thenextweb.com%22%20OR%20site%3A%22zerohedge.com%22%20OR%20site%3A%22livemint.com%22%20OR%20site%3A%22bitcointalk.org%22%20)%20language%3Aenglish%20performance_score%3A%3E1").body
    posts = response['posts']
    posts.each do |post|
      puts post['thread']['url']
      news = News.new(news_url: post['thread']['url'], site_full: post['thread']['site_full'], title: post['thread']['title'], description: post['text'] , published: post['thread']['published'], main_image: post['thread']['main_image'], performance_score: post['thread']['performance_score'], domain_rank: post['thread']['domain_rank'] , facebook_like: post['thread']['social']['facebook']['likes'],facebook_comment: post['thread']['social']['facebook']['comments'], facebook_share: post['thread']['social']['facebook']['shares'], linkedin_share: post['thread']['social']['linkedin']['shares'], author: post['author'], rating: 0.0)
      if news.save

      else

      end
    end
  end
end