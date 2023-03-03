Rails.application.routes.draw do
  get 'profiles/show'
  resources :posts
  resources :comments
  devise_for :users
  get '/my_profile', to: 'profiles#show'
  root to: "pages#home"
end
