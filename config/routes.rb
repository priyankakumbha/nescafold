Rails.application.routes.draw do

  root "shops#index"

  get '/main' => 'shops#index' , :as => 'main'

  get '/login' => 'session#login' , :as => 'login'
  post '/login' => 'session#create'

  get '/logout' => 'session#destroy' , :as =>"logout"



  resources :products
  resources :shops
  resources :orders
  resources :users
end
