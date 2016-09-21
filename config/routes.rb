Rails.application.routes.draw do

  root "shops#index"

  resources :products
  resources :shops
  resources :orders
  resources :users

  get '/main' => 'shops#index' , :as => 'main'

  get '/login' => 'session#login' , :as => 'login'
  post '/login' => 'session#create'

  get '/adminLogin' => 'session#adminLogin' , :as => 'adminLogin'
  post '/adminLogin' => 'session#adminCreate'

  get '/logout' => 'session#destroy' , :as =>"logout"
  get '/adminLogout' => 'session#adminDestroy' , :as =>"adminLogout"


  get '/lineItemList' => 'line_item#lineItemList'


end
