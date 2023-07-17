Rails.application.routes.draw do
  devise_for :users

  root to: "cares#index"

  resources :cares, only: [:index, :show, :new, :create, :edit, :update] do
    resources :users, only: [ :edit, :update]
  end
end
