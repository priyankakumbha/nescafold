Rails.application.routes.draw do
  root 'users#index'
  
  resources :products
  resources :shops
  resources :orders
  resources :users
end
