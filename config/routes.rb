Rails.application.routes.draw do
  devise_for :users

  root 'products#index'

  resources :products, only: %i[show index]
  resource :cart, only: %i[show]
end
