Rails.application.routes.draw do
  devise_for :users
  get "home/index"
  root "home#index"
  get "up" => "rails/health#show", as: :rails_health_check

  resources :posts do
    resources :comments, only: [ :create ]
    member do
      get :edit
      patch :update
    end
    collection do
      get :user_posts
    end
  end
end
