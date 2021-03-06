class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    user_keys = [:first_name, :last_name, :height]
    devise_parameter_sanitizer.permit(:sign_up, keys: user_keys)
    devise_parameter_sanitizer.permit(:sign_in, keys: user_keys)
    devise_parameter_sanitizer.permit(:account_update, keys: user_keys)
  end

  def after_sign_in_path_for(resource)
    dashboard_path
  end
end
