class UsersController < ApplicationController

  def show
      @user = User.find(params[:id])
      @name = @user.first_name
      @user_id = @user.id
 
 end
  
  def edit
  end
end

