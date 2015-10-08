Rails.application.routes.draw do
  resources :order_items, only: [ :create, :update, :destroy]
  resource :cart, only: [:show]
  resources :products
  resources :product_types

  get 'all_products', to: 'products#all_products'

  root to: "products#index"
end
