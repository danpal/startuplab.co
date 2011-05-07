StartuplabCo::Application.routes.draw do
  #pages
  root :to => "pages#index"


  match '/contact_us', :to => 'pages#contact_us'
  match '/help', :to => 'pages#help'
  match '/faq', :to => 'pages#faq'
  match '/index', :to => 'pages#index'

  #users
  resources :users
  


  #authentication 
  match "/auth/:provider/callback" => "sessions#create"  
  match "/signout" => "sessions#destroy", :as => :signout  
  match "signin", :to => 'pages#signin' 


end
