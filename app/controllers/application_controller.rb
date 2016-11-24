class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role, :phone, :username, :email, :password])
  end

end
