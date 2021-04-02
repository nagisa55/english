Rails.application.routes.draw do
  root to: "toppages#index"

  post "/guest", to: "guest_sessions#create"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "signup", to: "users#new"

  resources :users

  resources :posts do
    resources :comments, only: [:create, :destroy]
    resources :favoriets, only: [:create, :destroy]
    collection do
      get :search
    end
  end

  resources :categories
end
