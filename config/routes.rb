Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :users
  resources :portfolios
  post 'portfolio_details', to: 'portfolios#save_details'

  match 'auth/:provider/callback', to: 'sessions#create', via: :get
  delete 'session/destroy', to: 'sessions#destroy'

  get 'companies', to: 'companies#index'
  get 'dashboards', to: 'dashboards#index'

  get 'trade_stocks', to: 'trade_stocks#index'

  mount ActionCable.server => '/cable'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
