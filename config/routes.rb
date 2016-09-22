Rails.application.routes.draw do

  get 'messages/reply'

  root "shops#index"

  resources :products
  resources :shops
  resources :orders
  resources :users
  

  resource :messages do
    collection do
      post 'reply'
    end
  end

  get '/main' => 'shops#index' , :as => 'main'

  get 'trigger' => 'notifications#trigger_sms_alerts' , :as => 'trigger'

  get '/sms' => 'notifications#getPhoneNumber' , :as =>'sms'
  post '/sms' => 'notifications#send_message'

  get '/login' => 'session#login' , :as => 'login'
  post '/login' => 'session#create'


  get '/adminLogin' => 'session#adminLogin' , :as => 'adminLogin'
  post '/adminLogin' => 'session#adminCreate'

  get '/adminmain' => 'orders#adminmain' , :as=> 'adminmain'

  get '/logout' => 'session#destroy' , :as =>"logout"
  get '/adminLogout' => 'session#adminDestroy' , :as =>"adminLogout"

  put '/updatestatus' => 'orders#updatestatus' , :as => 'updatestatus'
  # post '/updatestatus' => 'orders#updatestatus'

  get '/lineItemList' => 'line_item#lineItemList'
  get '/test' => 'users#test' , :as => 'test'

end
