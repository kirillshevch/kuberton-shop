Rails.application.routes.draw do
  root 'products#index'

  resources :products, only: %w[show index]
end
