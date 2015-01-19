require 'factory_girl_rails'
require 'faker'

class UserMailerPreview < ActionMailer::Preview
  include FactoryGirl::Syntax::Methods

  def confirmation_instructions
    reload_factories
    user = build(:user)
    token = Devise.friendly_token
    UserMailer.confirmation_instructions(user, token)
  end

  def invitation_instructions
    reload_factories
    user = build(:invited_user)
    token = Devise.friendly_token
    UserMailer.invitation_instructions(user, token)
  end

  def reset_password_instructions
    reload_factories
    user = build(:confirmed_user)
    token = Devise.friendly_token
    UserMailer.reset_password_instructions(user, token)
  end

  def unlock_instructions
    reload_factories
    user = build(:confirmed_user)
    token = Devise.friendly_token
    UserMailer.unlock_instructions(user, token)
  end

  private

  def reload_factories
    FactoryGirl.reload
  end
end
