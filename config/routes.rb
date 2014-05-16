Blocitoff::Application.routes.draw do

  devise_for :users, :controllers => { :registrations => "registrations" }

  resources :todos, only: [:destroy, :index, :new, :create, :show]

  root 'todos#index'

end
