Rails.application.routes.draw do
  resources :posts
  resources :comments
  devise_for :users
  get '/my_profile', to: 'profiles#show'
  root to: "posts#index"
end
