class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
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

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:email, :password, :firstname, :lastname]
    devise_parameter_sanitizer.for(:account_update) << [:email, :password, :firstname, :lastname]
  end

end
