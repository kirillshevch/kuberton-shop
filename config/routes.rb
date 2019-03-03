Rails.application.routes.draw do
  devise_for :users

  root 'products#index'

  resources :products, only: %w[show index]
  resource :checkout, only: %w[show]
end
