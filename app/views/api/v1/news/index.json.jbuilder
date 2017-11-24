json.array! @news.each do |news|
  json.news_url news.news_url
  json.site_full news.site_full
  json.title news.title
  json.description news.description
  json.published news.published
  json.main_image news.main_image
  json.performance_score news.performance_score
  json.domain_rank news.domain_rank
  json.facebook_like news.facebook_like
  json.facebook_comment news.facebook_comment
  json.facebook_share news.facebook_share
  json.linkedin_share news.linkedin_share
  json.author news.author
  json.rating news.rating
end