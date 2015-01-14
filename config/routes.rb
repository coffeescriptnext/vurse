Rails.application.routes.tap do |routes|
  app_config = Rails.configuration.snippety

  routes.default_url_options = {
    host:     app_config[:tld_host],
    protocol: app_config[:tld_protocol]
  }

  routes.draw do
    namespace :api do
      root to: 'root#index'
    end
  end
end
