class CaresController < ApplicationController
  def index
    @user = User.all

  end
  def new
    @user_category = UserCategory.new
  end
  def create
    @user_category = UserCategory.new(user_category_params)
    if @user_category.save
      redirect_to root_path
      
    else
      render :new
    end
  end

  def lecture_new
    @lecture = Lecture.new
  end
  def lecture_create
    @lecture = Lecture.new(lecture_params)
  end

  private

  def user_category_params
    params.require(:user_category).permit(:employment, :affiliation, :rank_id, :complete_id).merge(user_id: current_user.id)
  end

  def lecture_params
    params.require(:lecture).permit(:field_id, :lecture_name, :lecture_day, :lecture_time, :instructor_name).marge(user_id: current_user.id)
  end
  # def search
  #   query = params[:query]
  #   results = User.where("name LIKE ? OR name_reading LIKE ?", "%#{query}%", "%#{query}%")
  #   # 検索
  # end
end
