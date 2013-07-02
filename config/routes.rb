Brews::Application.routes.draw do
  resources :submissions

  get "sessions/new"

  resources :games do
    resources :questions
    put :activate
    put :deactivate
    get :next_question
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
