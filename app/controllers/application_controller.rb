class ApplicationController < ActionController::Base

  before_action :basic_auth

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username ==  ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
<<<<<<< Updated upstream
=======
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
>>>>>>> Stashed changes
  end
end
