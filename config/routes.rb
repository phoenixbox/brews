Brews::Application.routes.draw do
  get "games/new"

  get "games/create"

  get "games/index"

  get "games/show"

  root :to => 'home#show'
end
