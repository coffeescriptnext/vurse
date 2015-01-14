unless defined?(Rails)
  ENV['RAILS_ROOT'] = File.expand_path('../../', __FILE__)
  require File.expand_path('../../config/environment', __FILE__)
end

Teaspoon.configure do |config|
  config.suite do |suite|
    suite.use_framework :mocha
    suite.matcher = '{spec/javascripts,app/assets}/**/*-spec.{js}'
  end

  config.coverage do |coverage|
    coverage.reports = %w(html text-summary)
    coverage.output_path = 'coverage/javascript'
  end
end
