class CaresController < ApplicationController
  before_action :authenticate_user!, except: [:index, :search, :edit, :update,:print_user_list]
  before_action :set_lecture, only: [:lecture_edit, :lecture_update]
  before_action :set_user_category, only: [:edit, :update]
  before_action :set_lecture_user , only: [ :lecture_edit, :lecture_update ]
  before_action :restrict_direct_access ,only: [:edit, :update]
  
  # ====usercategoryコントローラー====
  def index
    @users = User.all
    @search = User.ransack(params[:q])
    @users_name = @search.result(distinct: true)
    @category = UserCategory.all
  end

  def print_user_list
    @users = User.all
    @search = User.ransack(params[:q])
    @users_name = @search.result(distinct: true)
    @category = UserCategory.all

    respond_to do |format|
      format.html do
        redirect_to print_user_list_cares_path(format: :pdf, debug: 1)
      end

      format.pdf do
        render pdf: "print_user_list",   # PDFのファイル名を指定
               layout: 'application.pdf.erb',                   # レイアウトファイルの指定
               template: "cares/print_user_list.pdf.erb",  # 印刷するビューファイルのパス
               orientation: 'Landscape',   # PDFを横向きにする
               encoding: 'UTF-8',
               font: 'IPAゴシック'
      end
    end
  end

  def search
    @search = User.ransack(params[:q])  # User モデルを適宜変更
    @users = @search.result(distinct: true)
  end
  

  def new
    @user = User.new
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
    if @user_category.update(user_category_params)
      if current_user
        redirect_to user_path(current_user)
      else
        redirect_to user_path(@user_category.user)
      end
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

  def set_lecture_user
    @lecture = Lecture.find(params[:id])
  end

  def set_lecture
    @user = current_user 
    @lecture = @user.lectures
    @user_category = @user.user_category
  end
  def set_security
    unless @user == current_user
      redirect_to root_path
    end
  end

  def restrict_direct_access
    unless admin_signed_in? || (current_user == @user_category.user)
      redirect_to root_path
    end
  end
  
  def user_category_params
    if current_user.present?
      params.require(:user_category).permit(:employment, :affiliation, :rank_id, :complete_id).merge(user_id: current_user.id)
    else
      params.require(:user_category).permit(:employment, :affiliation, :rank_id, :complete_id)
    end
  end

  def lecture_params
    params.require(:lecture).permit(:field_id, :lecture_name, :lecture_day, :lecture_time, :instructor_name).merge(user_id: current_user.id)
  end
end
