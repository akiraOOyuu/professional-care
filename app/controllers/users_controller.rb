class UsersController < ApplicationController

  def show
      @user = User.find(params[:id])
      @name = @user.first_name
      @user_id = @user.id
      @user_category = @user.user_category
      @lecture = @user.lectures
 end

  
  def edit
  end
end

