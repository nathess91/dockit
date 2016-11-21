class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    '/home'
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role, :phone, :username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone, :username])
  end

end
