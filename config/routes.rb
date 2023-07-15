Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'users/edit/name', to: 'devise/registrations#edit_name', as: 'edit_name'
    put 'users/update/name', to: 'devise/registrations#update_name', as: 'update_name'
    get 'users/edit/address', to: 'devise/registrations#edit_address', as: 'edit_address'
    put 'users/update/address', to: 'devise/registrations#update_address', as: 'update_address'
    get 'users/edit/password', to: 'devise/registrations#edit_password', as: 'edit_password'
    put 'users/update/password', to: 'devise/registrations#update_password', as: 'update_password'
  end

  root to: "cares#index"

  
  resource :care, only: :index do
    resources :users, only: [:edit, :update] 
  end

end
