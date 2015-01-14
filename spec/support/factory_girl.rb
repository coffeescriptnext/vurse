require 'support/database_cleaner'
require 'factory_girl_rails'
require 'faker'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.use_transactional_fixtures = false
end
