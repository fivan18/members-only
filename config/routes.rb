Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/create'
  get 'posts/index'
  root 'posts#index'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get "/logout", to: "sessions#destroy"

  resources :posts, only: [:new, :index, :create, :show]

end
