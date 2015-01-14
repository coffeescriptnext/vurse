Rails.application.configure do
  # Railties configuration
  config.cache_classes = true
  config.consider_all_requests_local = false
  config.eager_load = true
  config.force_ssl = true
  config.log_level = :debug
  config.serve_static_files = config.snippety[:serve_static_files].present?

  # ActionController configuration
  config.action_controller.perform_caching = true

  # ActionDispatch configuration
  config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect'

  # ActiveRecord configuration
  config.active_record.dump_schema_after_migration = false

  # ActiveSupport configuration
  config.active_support.deprecation = :notify

  # I18n configuration
  config.i18n.fallbacks = true

  # Sprockets configuration
  config.assets.compile = false
  config.assets.digest = true
  config.assets.js_compressor = :uglifier
end
