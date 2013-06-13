Brews::Application.routes.draw do
  resources :games

  root :to => 'home#show'
end
