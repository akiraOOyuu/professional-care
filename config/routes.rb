Rails.application.routes.draw do
  devise_for :users

  root to: "cares#index"

  resources :cares, only: [:index, :new, :create] do
    resources :users, only: [:edit, :update]
  end

  resources :users, only: :show
end
