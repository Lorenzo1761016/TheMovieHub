class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper
    before_action :configure_permitted_parameters, if: :devise_controller?
    #after_action :track_action


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :date_of_birth, :gender,
                                      :first_name, :last_name, :gender])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :date_of_birth, :gender,
                                      :first_name, :last_name, :twittername, :phone_number, :bio])
  end
  # track events with ahoy_matey gem.
  def track_action
  ahoy.track "Visitata #{controller_name}##{action_name}", request.filtered_parameters
  end
end
