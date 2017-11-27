Rails.application.routes.draw do
  require 'sidekiq/web'

  resources :articles
  root 'articles#index'
  
  mount Sidekiq::Web, at: "/sidekiq"
end
