class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  # add_flash_types :danger, :info, :warning, :success, :messages
  # before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!

  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password password_confirmation])
  # en
end
