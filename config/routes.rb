Rails.application.routes.draw do
  get 'categories/index'
  root to: "toppages#index"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "signup", to: "users#new"
  resources :users
  resources :posts
  resources :favorites, only: [:create, :destroy]
  resources :categories
end
