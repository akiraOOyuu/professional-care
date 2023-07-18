Rails.application.routes.draw do
  devise_for :users

  root to: "cares#index"

  resources :cares, only: [:index, :new, :create, :lecture_new, :lecture_create]

  resources :users, only: [:show, :edit, :update]
end
