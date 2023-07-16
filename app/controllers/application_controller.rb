class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username ==  ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, 
                                        keys: [:email, 
                                          :password, 
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
end
