class UsersController < ApplicationController

  def show
      @user = User.find(params[:id])
      @name = @user.first_name
      @user_id = @user.id
      @user_category = @user.user_category
      @lecture = @user.lectures
      @lecture = @user.lectures.includes(:user).order("lecture_day DESC")
      
      redirect_to root_path unless @user == current_user
   end
  #  user編集機能 その他情報 住所とか
   def edit_other_info
    @user = User.find(params[:id])
    end
  
    def update_other_info
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to root_path, notice: "プロフィールが更新されました。"
      else
        flash.now[:alert] = "プロフィールの更新に失敗しました。"
        render :edit_other
    end
  end

  
    private

  
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