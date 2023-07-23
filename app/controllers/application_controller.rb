class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def update_resource(resource, user_params)
    resource.update_without_password(user_params.except(:password, :password_confirmation))
  end

  def after_update_path_for(resource)
    user_path(resource)
  end
end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username ==  ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, 
                                        keys: [:email, 
                                          :worker_prefecture_id, 
                                          :childcare_worker_number, 
                                          :childcare_worker_id, 
                                          :first_name, :last_name, 
                                          :first_name_reading, 
                                          :last_name_reading, 
                                          :birth_date, :postcode, 
                                          :prefecture_id, 
                                          :city, 
                                          :block, 
                                          :building])
                                          # パスワードとパスワード確認の項目を許可リストから削除する
      #  devise_parameter_sanitizer.permit(:account_update,
      #                    :email, 
      #                    :worker_prefecture_id, 
      #                    :childcare_worker_number, 
      #                    :childcare_worker_id, 
      #                    :first_name, 
      #                    :last_name, 
      #                    :first_name_reading, 
      #                    :last_name_reading, 
      #                    :birth_date, 
      #                    :postcode, 
      #                    :prefecture_id, 
      #                    :city, 
      #                    :block, 
      #                    :building,
      #                     )
  end
  end
