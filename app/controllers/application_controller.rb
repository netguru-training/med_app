class ApplicationController < ActionController::Base
  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_patient
    if user_signed_in? && current_user.doctor?
      redirect_to root_path, alert: 'You are not allowed to perfom this action.'
    end
  end

end
