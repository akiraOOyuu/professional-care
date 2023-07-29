class ApplicationController < ActionController::Base
  before_action :basic_auth
  # before_action :authenticate_user!, only: :new
  # before_action :authenticate_admin!, only: :index
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  # def after_sign_in_path_for(resource)
  #   root_path
  # end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username ==  ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
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
    end
end

