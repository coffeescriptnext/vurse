class RegistrationsController < Devise::RegistrationsController
  ALLOWED_CREATE_PARAMS = %i(email username password)
  ALLOWED_UPDATE_PARAMS = %i(email username name password current_password)

  before_action :configure_permitted_parameters

  layout 'authentication', only: %i(new)

  private

  def after_update_path_for(_resource)
    edit_user_registration_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(*ALLOWED_CREATE_PARAMS) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(*ALLOWED_UPDATE_PARAMS) }
  end
end
