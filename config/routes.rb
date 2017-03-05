Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "pages#home"
  get "/news", to: "pages#news_index"
  get "/news/:id", to: "pages#news_show"
  get "/till_now", to: "pages#till_now"
  post '/email_subscriptions', to: 'email_subscriptions#create'
  get '/resources', to: "pages#resources"
end
