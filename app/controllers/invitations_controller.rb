class InvitationsController < Devise::InvitationsController
  before_action :configure_permitted_parameters

  layout 'authentication'

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:accept_invitation) do |u|
      u.permit(:username, :password, :invitation_token)
    end
  end
end
