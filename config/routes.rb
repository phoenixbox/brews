Brews::Application.routes.draw do
  resources :submissions


  resources :questions


  get "sessions/new"

  resources :games do
    put :activate
    put :deactivate
  end

  resources :users
  resources :sessions
  resources :teams
  
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"

  post 'messages' => 'messages#create'

  root :to => 'home#show'
end
