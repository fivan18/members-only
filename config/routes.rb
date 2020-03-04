Rails.application.routes.draw do
  root 'sessions#home'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
end
