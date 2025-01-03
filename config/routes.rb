Rails.application.routes.draw do
  devise_for :users
  get "home/index"
  root "home#index"
  get "up" => "rails/health#show", as: :rails_health_check
  resources :posts, only: [ :index, :new, :create ] do
    resources :comments, only: [ :create ]
  end
end
