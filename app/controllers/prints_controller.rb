class PrintsController < ApplicationController

  def index
    @users = User.all
    @search = User.ransack(params[:q])
    @users_name = @search.result(distinct: true)
    @category = UserCategory.all
  end
end
