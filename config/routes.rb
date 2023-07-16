Rails.application.routes.draw do
  # devise_for :users

  root to: "cares#index"

<<<<<<< Updated upstream
  
  resource :care, only: :index do
    
=======
  resources :cares, only: [:index, :new, :create] do
    resources :users, only: [:edit, :update]
>>>>>>> Stashed changes
  end

  resources :users, only: :show
end
