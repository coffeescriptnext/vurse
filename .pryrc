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
  environment_color =
    case ENV['RAILS_ENV']
    when 'development', 'test'
      :light_blue
    when 'production'
      :red
    when 'staging'
      :yellow
    else
      :light_blue
    end

  environment_name = "[#{ENV['RAILS_ENV']}]".colorize(environment_color).bold

  "#{'Vurse'.bold} #{environment_name} $ "
end
