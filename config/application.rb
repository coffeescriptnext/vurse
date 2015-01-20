require File.expand_path('../boot', __FILE__)

require 'active_model/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'

Bundler.require(*Rails.groups)

module Vurse
  module VERSION
    MAJOR = 1
    MINOR = 0
    PATCH = 0
    PRE = 'alpha'

    STRING = [MAJOR, MINOR, PATCH, PRE].compact.join('.')
  end

  class Application < Rails::Application
    # Snippety configuration
    config.vurse = config_for(:vurse).deep_symbolize_keys

    # General Rails configuration
    config.force_ssl = true if config.vurse[:tld_protocol] == 'https'
    config.log_formatter = Logger::Formatter.new
    config.log_level = config.vurse[:log_level].to_sym

    if config.vurse[:log_stdout].present?
      config.logger = Logger.new(STDOUT)
    else
      config.logger = Logger.new("#{config.vurse[:log_root]}/#{Rails.env}.rails.log")
    end

    config.before_initialize do
      STDOUT.sync if config.vurse[:log_stdout].present?
    end

    # Rack::Attack configuration
    config.middleware.use Rack::Attack

    # Rack::Cors configuration
    config.middleware.insert_before 'ActionDispatch::Static', 'Rack::Cors' do
      allow do
        origins Rails.configuration.vurse[:tld_host]
        resource '/api/*', headers: :any, methods: %i(get patch post put delete options)
      end
    end

    # ActionMailer configuration
    config.action_mailer.default_url_options = {
      host:     Rails.configuration.vurse[:tld_host],
      protocol: Rails.configuration.vurse[:tld_protocol]
    }

    config.action_mailer.delivery_method = config.vurse[:email_delivery_method].to_sym
    if config.action_mailer.delivery_method == :smtp
      config.action_mailer.smtp_settings = {
        user_name:      config.vurse[:smtp_user_name],
        password:       config.vurse[:smtp_password],
        address:        config.vurse[:smtp_address],
        domain:         config.vurse[:smtp_domain],
        port:           config.vurse[:smtp_port].try(:to_i),
        authentication: config.vurse[:smtp_authentication].try(:to_sym)
      }
    end

    # ActiveRecord configuration
    config.active_record.raise_in_transactional_callbacks = true

    # Lograge configuration
    config.lograge.enabled = true
    config.lograge.custom_options = lambda do |event|
      { request_id: event.payload[:request_id], time: event.time }
    end
  end
end
