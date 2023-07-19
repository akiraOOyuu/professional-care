Rails.application.routes.draw do
  devise_for :users

  root to: "cares#index"

  resources :cares, only: [:index, :new, :create] do
    collection do
      get :lecture_new
      post :lecture_create
    end
  end

  resources :users, only: [:show, :edit, :update]
end
