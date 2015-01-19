# Mailer for account-related messages.
class UserMailer < Devise::Mailer
  include Roadie::Rails::Automatic

  layout 'mailer'
end
