require 'bundler/setup'
Bundler.require(:console)
Bundler.require(:debugger)

begin
  require 'factory_girl_rails'
  require 'faker'

  extend FactoryGirl::Syntax::Methods
rescue LoadError
  puts 'FactoryGirl and/or Faker are not available.'
end

Pry.config.prompt_name = begin
  environment_name = case ENV['RAILS_ENV']
  when 'development'
    'development'.colorize(:light_blue).underline
  when 'test'
    ENV['RAILS_ENV'].colorize(:light_blue).underline
  when 'production'
    ENV['RAILS_ENV'].colorize(:red).underline
  else
    'development'.colorize(:light_blue).underline
  end

  "#{'snippety'.bold} [#{environment_name}] "
end
