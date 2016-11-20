class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def authorize_admin_manager
    return unless !current_user.admin? || !current_user.manager?
      redirect_to :back, alert: 'Admins only!'
  end

end
