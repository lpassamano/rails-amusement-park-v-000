Rails.application.routes.draw do
  root 'welcome#home'
  get '/users/new', to: 'users#new'
  post '/users/new'
end
