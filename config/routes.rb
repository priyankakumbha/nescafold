Rails.application.routes.draw do
  resources :products
  resources :shops
  resources :orders
  resources :users
end
