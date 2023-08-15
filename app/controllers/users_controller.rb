class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :destroy_user]
  before_action :restrict_direct_access, only: [ :show, :edit_other_info, :update_other_info]
  before_action :set_user, only: [:show, :edit_other_info, :update_other_info]

  def show
      @name = @user.first_name
      @user_id = @user.id
      @user_category = @user.user_category
      @lecture = @user.lectures
      @lecture = @user.lectures.includes(:user).order("lecture_day DESC")
      

   end
  #  user編集機能 その他情報 住所とか
   def edit_other_info
   end
  
    def update_other_info
      if @user.update(user_params)
        redirect_to user_path(current_user.id)
      else
        render :edit_other_info
      end
    end

    def destroy_user
      user = User.find(params[:id])
      user.destroy
      redirect_to root_path

    end

  
    private
    
    def set_user
      @user = User.find(params[:id])
    end
    def restrict_direct_access
      @user = User.find(params[:id])
      unless admin_signed_in? || current_user == @user
        redirect_to root_path
      end
    end
  
    def user_params
      params.require(:user).permit(:email, 
                                   :worker_prefecture_id, 
                                   :childcare_worker_number, 
                                   :childcare_worker_id, 
                                   :first_name, 
                                   :last_name, 
                                   :first_name_reading, 
                                   :last_name_reading, 
                                   :birth_date, 
                                   :postcode, 
                                   :prefecture_id, 
                                   :city, 
                                   :block, 
                                   :building,
                                   )
    end
  end