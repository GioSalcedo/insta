Rails.application.routes.draw do
  resources :posts
  resources :comments
  devise_for :users
  root to: "pages#home"
end
