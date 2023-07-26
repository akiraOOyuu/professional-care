Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: {
    # パス編集
    registrations: 'users/registrations'
  }

  root to: "cares#index"

    # 講義内容登録・編集
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
  resources :users, only: [:show] do
    #  パス以外のユーザー情報編集
    member do
      get :edit_other_info
      patch :update_other_info
    end
  end
end