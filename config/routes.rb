StartuplabCo::Application.routes.draw do
  #pages
  root :to => "pages#index"


  match '/contact_us', :to => 'pages#contact_us'
  match '/faq', :to => 'pages#faq'
  match '/index', :to => 'pages#index'
  match '/about', :to => 'pages#about'
  match '/apply', :to => 'pages#apply'
  match '/rules', :to => 'pages#rules'
  match '/companies', :to => 'pages#companies'
  
  
  #users
  resources :users

  #applications
  resources :applications

  #events
  resources :events

  #administration
  match "/admin", :to => 'pages#admin'


  #authentication 
  match "/auth/:provider/callback" => "sessions#create"  
  match "/signout" => "sessions#destroy", :as => :signout  
  match "/signin", :to => 'pages#signin' 

  
end
