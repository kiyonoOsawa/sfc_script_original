Rails.application.routes.draw do
  root "home#index"
  # resources :home
  resources :team_users
  resources :friend_users
  resources :tasks
  resources :users
  resources :sessions, only: [ :new, :create, :destroy ]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  get "home/:id", to: "home#index", as: "home"  # ユーザーに対応したhome画面

  resources :home do
    member do
      get "task/new", to: "tasks#new", as: "new_task"
    end
  end

  get "login", to: "sessions#new"
  delete "logout", to: "sessions#destroy"

  # match "/signup",  to: "users#new"
  # Defines the root path route ("/")
  # root "posts#index"
end
