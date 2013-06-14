Brews::Application.routes.draw do
  get "sessions/new"

  get "users/new"
  resources :games
  resources :sessions, :only => [:create]
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"

  root :to => 'home#show'
end
