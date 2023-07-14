Rails.application.routes.draw do
  # devise_for :users

  root to: "cares#index"

  
  resource :care, only: :index do
    
  end

end
