Rails.application.routes.draw do
  devise_for :users
  # devise_for :users

  root to: "cares#index"

  
  resource :care, only: :index do
    resources :users, only: [:edit, :update] 
  end

end
