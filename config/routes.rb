Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
    #user passの情報編集
    registrations: 'users/registrations'
  }
 
  root to: "cares#index"



    # 講義内容登録・編集・削除
  resources :cares, only: [:index, :new, :create, :edit, :update] do
    collection do
      get :search
      get :lecture_new
      post :lecture_create
    end
     member do
    get :lecture_edit
    patch :lecture_update
    delete :lecture_delete
    end
  end
    #パス以外のユーザー情報編集
  resources :users, only: [:show] do
    member do
      get :edit_other_info
      patch :update_other_info
    end
  end
end