# frozen_string_literal: true

class Admins::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]


  # GET /resource/sign_up
  def new
    @admin = Admin.new
  end

  # POST /resource
  def create
    entered_password = params[:admin][:entered_password]
    admin_password = ENV['ADMIN_PASSWORD']
    if entered_password == admin_password
      @admin = Admin.new(admin_params)
      
        if @admin.save
          redirect_to  root_path, notice: '管理者が登録されました。'
        else
          render :new
        end
    else
      flash.now[:alert] = '管理者パスワードが一致しません。'
      redirect_to :admin_registration_path
    end
  end
  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  private

  def configure_sign_up_params
    # カスタム属性を許可する処理をここに記述します
    devise_parameter_sanitizer.permit(:sign_up, keys: [:facility, :email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:facility, :email])
  end

  def admin_params
    params.require(:admin).permit(:facility, :email, :password, :password_confirmation)
  end
end
