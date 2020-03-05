Rails.application.routes.draw do
  root 'posts#index'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get "/logout", to: "sessions#destroy"
  get '/signup', to: 'users#new'

  resources :users, only: [:new, :index, :create]
  resources :posts, only: [:new, :index, :create, :show]

end
