Rails.application.routes.draw do
  resources :posts, only: [:index, :new, :create]
  resources :comments, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  devise_for :users
  get '/my_profile', to: 'profiles#show'
  root to: "posts#index"
end
