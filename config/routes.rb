Rails.application.routes.draw do

  root 'welcome#home'
  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:index, :show]

  get '/signin', to: 'session#new'
  post 'session', to: 'session#create'
  delete '/users/:id/logout', to: 'session#destroy', as: 'session_destroy'
end
