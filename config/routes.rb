Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "pages#subscribe"
  get "/till_now", to: "pages#till_now"
  post "/email_subscriptions", to: "email_subscriptions#create"
  get "/hotshots", to: "pages#hotshots"
  # get "/resources", to: "pages#resources"
  get "/news", to: "pages#abc_news"
  get "/cafe", to: "pages#cafe"
  
  #user routes  
  get "/signup", to: "users#new"
  post "/users", to: "users#create"

  #session routes
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  #products routes
  get '/products', to: 'products#index'
  get '/products/new', to: 'products#new'
  get '/products/:id', to: 'products#show'
  post '/products', to: 'products#create'
  get '/products/:id/edit', to: 'products#edit'
  patch '/products/:id', to: 'products#update'
  delete 'products/:id',to: 'products#destroy'
  post '/products/search', to: 'products#search'

  #images routes
  get '/images/new', to: 'images#new'
  post '/images', to: 'images#create'

  #Carts routes
  get '/carted_products', to: 'carted_products#index'  
  post '/carted_products', to: 'carted_products#create'
  delete '/carted_products/:id', to: 'carted_products#destroy'

  #Orders routes
  get '/orders/:id', to: 'orders#show'
  patch '/orders/:id', to: 'orders#update'

  # resources routes
  get '/resources', to: 'resource_categories#index'
  get '/resources/:id', to: 'resource_categories#show'
  get '/resource_categories/new', to: 'resource_categories#new'
  post '/resource_categories', to: 'resource_categories#create'
  get '/resource/new', to: 'resources#new'
  post '/resources', to: 'resources#create'
end
