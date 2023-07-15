class Devise::RegistrationsController < DeviseController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def edit_name
    render :edit_name
  end

  def update_name
    # ユーザーの名前を更新するためのアクション
  end

  def edit_address
    render :edit_address
  end

  def update_name
    # ユーザーの名前を更新するためのアクション
  end
  def edit_password
    render :edit_password
  end

  def update_password
    # ユーザーの名前を更新するためのアクション
  end
  private

  def configure_permitted_parameters
    # 許可されたパラメーターをカスタマイズするためのメソッド
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
  def user_params
    params.require(:user).permit( :title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end