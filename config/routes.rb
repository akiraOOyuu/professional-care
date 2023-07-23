Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  root to: "cares#index"

  resources :cares, only: [:index, :new, :create,:edit, :update ] do
    collection do
      get :lecture_new
      post :lecture_create
    end
    member do
      get :lecture_edit
      patch :lecture_update
      delete :lecture_delete
    end
  end

  resources :users, only: [:show, :edit, :update]
end
