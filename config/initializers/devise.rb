app_config = Rails.configuration.snippety

Devise.setup do |config|
  # ORM configuration
  require 'devise/orm/active_record'

  # General configuration
  config.authentication_keys = %i(login)
  config.case_insensitive_keys = %i(login)
  config.paranoid = true
  config.secret_key = Rails.application.config.secret_key_base
  config.skip_session_storage = %i(http_auth)
  config.strip_whitespace_keys = %i(login)

  # Mailer configuration
  config.mailer = 'UserMailer'
  config.mailer_sender = app_config[:devise_mailer_sender]

  # Configuration for :confirmable
  config.allow_unconfirmed_access_for = app_config[:devise_allow_unconfirmed_access_for].to_i.days
  config.confirm_within = app_config[:devise_confirm_within].to_i.days if app_config[:devise_confirm_within]
  config.confirmation_keys = %i(login)
  config.reconfirmable = true

  # Configuration for :database_authenticatable
  config.pepper = Rails.application.secrets.devise_pepper
  config.stretches = Rails.env.test? ? 1 : app_config[:devise_stretches].to_i

  # Configuration for :invitable
  config.invite_for = app_config[:devise_invite_for].to_i.weeks
  config.invite_key = { email: EmailValidator.regexp }
  config.invited_by_class_name = 'User'
  config.invitation_limit = app_config[:devise_invitation_limit].to_i

  # Configuration for :lockable
  config.lock_strategy = :failed_attempts
  config.maximum_attempts = app_config[:devise_maximum_attempts].to_i
  config.unlock_in = app_config[:devise_unlock_in].to_i.minutes
  config.unlock_keys = %i(login)
  config.unlock_strategy = :both

  # Configuration for :rememberable
  config.expire_all_remember_me_on_sign_out = true
  config.remember_for = app_config[:devise_remember_for].to_i.days
  config.rememberable_options = (Rails.env.production? || Rails.env.staging?) ? { secure: true } : {}

  # Configuration for :recoverable
  config.reset_password_keys = %i(login)
  config.reset_password_within = app_config[:devise_reset_password_within].to_i.minutes

  # Scoped views configuration
  config.scoped_views = false

  # Navigation configuration
  config.sign_out_via = :delete
  config.sign_out_all_scopes = false
end
