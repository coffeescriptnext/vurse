Rails.application.configure do
  # Railties configuration
  config.cache_classes = true
  config.consider_all_requests_local = true
  config.eager_load = false
  config.serve_static_files  = true
  config.static_cache_control = 'public, max-age=3600'

  # ActionController configuration
  config.action_controller.allow_forgery_protection = false
  config.action_controller.perform_caching = false

  # ActionDispatch configuration
  config.action_dispatch.show_exceptions = false

  # ActionMailer configuration
  config.action_mailer.delivery_method = :test

  # ActionView configuration
  config.action_view.raise_on_missing_translations = true

  # ActiveSupport configuration
  config.active_support.deprecation = :stderr
  config.active_support.test_order = :random

  # Bullet configuration
  config.after_initialize do
    Bullet.enable = true
    Bullet.bullet_logger = true
    Bullet.raise = false
  end
end
