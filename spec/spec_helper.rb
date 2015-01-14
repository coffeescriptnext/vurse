require File.expand_path('../../config/boot', __FILE__)
require 'simplecov'

RSpec.configure do |config|
  config.default_formatter = 'doc' if config.files_to_run.one?
  config.deprecation_stream = 'log/test.deprecations.log'
  config.filter_run :focus
  config.order = :random
  config.profile_examples = 10 if ENV['PROFILE_SPECS']
  config.run_all_when_everything_filtered = true

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

  Kernel.srand config.seed
end
