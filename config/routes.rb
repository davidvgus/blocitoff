Blocitoff::Application.routes.draw do

  resources :todos, only: [:new, :create, :show]

end
