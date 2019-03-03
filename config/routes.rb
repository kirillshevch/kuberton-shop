Rails.application.routes.draw do
  devise_for :users

  root 'products#index'

  resources :products, only: %i[show index]
  resource :cart, only: %i[show]
  resources :line_items, only: %i[create destroy]
  resource :checkout, only: %i[show]

  get 'complete', to: 'checkouts#complete'
end
