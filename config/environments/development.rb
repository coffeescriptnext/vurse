Rails.application.configure do
  # Railties configuration
  config.cache_classes = false
  config.consider_all_requests_local = true
  config.eager_load = false

  # ActionController configuration
  config.action_controller.perform_caching = false

  # ActionMailer configuration
  config.action_mailer.preview_path = Rails.root.join('lib/mailer_previews')
  config.action_mailer.raise_delivery_errors = false

  # ActionView configuration
  config.action_view.raise_on_missing_translations = true

  # ActiveRecord configuration
  config.active_record.migration_error = :page_load

  # ActiveSupport configuration
  config.active_support.deprecation = :log

  # Sprockets configuration
  config.assets.debug = true
  config.assets.digest = false
  config.assets.raise_runtime_errors = true

  # Bullet configuration
  config.after_initialize do
    Bullet.enable = true
    Bullet.bullet_logger = true
    Bullet.console = true
  end
end
