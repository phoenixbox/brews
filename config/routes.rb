Brews::Application.routes.draw do
  get "sessions/new"

  resources :games
  resources :users
  resources :sessions
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"

  root :to => 'home#show'
end
