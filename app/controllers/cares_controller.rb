class CaresController < ApplicationController
  def index
    @user = User.all

  end
  def new
    @user_category = UserCategory.new
  end
  def create
    @user_category = UserCategory.new(user_category_params)
  binding.pry
    if @user_category.save
      redirect_to root_path
      
    else
      render :new
    end
  end

  private

  def user_category_params
    params.require(:user_category).permit(:employment, :affiliation, :rank_id, :complete_id).merge(user_id: current_user.id)
  end
  # def search
  #   query = params[:query]
  #   results = User.where("name LIKE ? OR name_reading LIKE ?", "%#{query}%", "%#{query}%")
  #   # 検索
  # end
end
