class CaresController < ApplicationController
  before_action :authenticate_user!, except: [:index, :search]
  before_action :set_user_category, only: [:edit, :update]
  before_action :set_lecture , only: [ :lecture_edit, :lecture_update ]
  
  # ====usercategoryコントローラー====
  def index
    @users = User.all
  end

  def search
    # @users = User.all
    @keyword = params[:keyword]
    @users = User.search_by_name(@keyword)
    @affiliation = params[:affiliation_keyword]
  end
  

  def new
    @user_category = UserCategory.new
  end

  def create
    @user_category = UserCategory.new(user_category_params)
    if @user_category.save
      redirect_to  user_path(current_user.id)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if  @user_category.update(user_category_params)
      redirect_to user_path(current_user)
    else
      render :lecture_edit
    end
  end

  # =====講義コントローラー=====

  def lecture_new
    @lecture = Lecture.new
  end
  def lecture_create
    @lecture = Lecture.new(lecture_params)
    if @lecture.save
      redirect_to user_path(current_user)
      
    else
      render :lecture_new
    end
  end

  def lecture_edit
  end

  def lecture_update
    if @lecture.update(lecture_params)
      redirect_to user_path(current_user)
    else
      render :lecture_edit
    end
  end

  def lecture_delete
      lecture = Lecture.find(params[:id])
      lecture.destroy
      redirect_to user_path(current_user)
  end



  private

  def set_user_category
    @user_category = UserCategory.find(params[:id])
  end

  def set_lecture
    @lecture = Lecture.find(params[:id])
  end
  
  def user_category_params
    params.require(:user_category).permit(:employment, :affiliation, :rank_id, :complete_id).merge(user_id: current_user.id)
  end

  def lecture_params
    params.require(:lecture).permit(:field_id, :lecture_name, :lecture_day, :lecture_time, :instructor_name).merge(user_id: current_user.id)
  end
  # def search
  #   query = params[:query]
  #   results = User.where("name LIKE ? OR name_reading LIKE ?", "%#{query}%", "%#{query}%")
  #   # 検索
  # end
end
