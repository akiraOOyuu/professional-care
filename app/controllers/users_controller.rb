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
   def update
      @user = User.find(params[:id])
      if @user.valid?
        @user.update(update_params)
        redirect_to user_path(@user.id)
      else
        render :edit
      end
    end
    
    private
    def update_params
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
        :building,)
    end
end
