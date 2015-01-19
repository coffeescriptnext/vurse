# Controller for user authentication.
class SessionsController < Devise::SessionsController
  before_action :configure_permitted_parameters

  layout 'authentication'

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :password, :remember_me) }
  end
end
