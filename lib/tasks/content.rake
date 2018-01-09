namespace :import do
  task content: :environment do
    # FeaturedContent.delete_all
    response = Unirest.get("http://webhose.io/filterWebContent?token=c015c400-6e3b-4540-a2c0-d643354db3cc&format=json&ts=1508984148544&sort=crawled&q=(title%3A%22Bitcoin%22%20OR%20title%3A%22CryptoCurrency%22%20OR%20title%3A%22Etheruem%22%20OR%20title%3A%22Litecoin%22%20OR%20title%3A%22Ripple%22%20OR%20title%3A%22Monero%22%20OR%20title%3A%22Dash%22%20OR%20title%3A%22NEO%22%20OR%20title%3A%22Blockchain%22%20OR%20title%3A%22Decentralization%22%20OR%20title%3A%22Dapp%22%20OR%20title%3A%22Stellar%22%20OR%20title%3A%22ICO%22%20OR%20title%3A%22Token%22%20)%20(%20site%3A%22hackernoon.com%22%20OR%20site%3A%22aeon.co%22%20OR%20%22thecontrol.co%22)%20language%3Aenglish%20spam_score%3A%3C0.02").body
    posts = response['posts']
    posts.each do |post|
      puts post['thread']['url']
      news = FeaturedContent.new(news_url: post['thread']['url'], site_full: post['thread']['site_full'], title: post['thread']['title'], description: post['text'] , published: post['thread']['published'], main_image: post['thread']['main_image'], performance_score: post['thread']['performance_score'], domain_rank: post['thread']['domain_rank'] , facebook_like: post['thread']['social']['facebook']['likes'],facebook_comment: post['thread']['social']['facebook']['comments'], facebook_share: post['thread']['social']['facebook']['shares'], linkedin_share: post['thread']['social']['linkedin']['shares'], author: post['author'], rating: 0.0)
      if news.save

      else

      end
    end
  end
end