require 'sidekiq/web'

Rails.application.routes.draw do
  resources :events
  mount Sidekiq::Web => '/sidekiq'
  root to: 'events#index'
end
