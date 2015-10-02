Rails.application.routes.draw do
  resources :order_items, only: [ :create, :update, :destroy]
  resource :cart, only: [:show]
  resources :products, only: [ :index ]
  root to: "products#index"
end
