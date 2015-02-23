source 'https://rubygems.org'

ruby '2.2.0'

# Load dotenv-rails first for gems that offer ENV configuration
gem 'dotenv-rails', '~> 1.0', groups: %i(development)

# Core Rails dependencies
gem 'rails', '~> 4.2.0'
gem 'pg', '~> 0.18'
gem 'responders', '~> 2.1'

# General runtime dependencies
gem 'active_model_serializers', '~> 0.9'
gem 'cocoon', '~> 1.2'
gem 'devise', '~> 3.4'
gem 'devise_invitable', '~> 1.4'
gem 'diffy', '~> 3.0'
gem 'email_validator', '~> 1.5'
gem 'finishing_moves', '~> 0.3'
gem 'friendly_id', '~> 5.1'
gem 'github-linguist', '~> 4.4'
gem 'github-markdown', '~> 0.6'
gem 'github-markup', '~> 1.3'
gem 'high_voltage', '~> 2.2'
gem 'html-pipeline', '~> 1.11'
gem 'interactor', '~> 3.1'
gem 'kaminari', '~> 0.16'
gem 'lograge', '~> 0.3'
gem 'paper_trail', '~> 3.0'
gem 'pundit', '~> 0.3'
gem 'pygments.rb', '~> 0.6'
gem 'que', '~> 0.9'
gem 'rack-attack', '~> 4.2'
gem 'rack-cors', '~> 0.3', require: 'rack/cors'
gem 'roadie-rails', '~> 1.0'
gem 'sanitize', '~> 3.1'
gem 'sass-rails', '~> 5.0'
gem 'secure_headers', '~> 1.4'
gem 'uglifier', '~> 2.7'
gem 'wicked', '~> 1.1'

# Asset dependencies
gem 'ace-rails-ap', '~> 3.0'
gem 'autoprefixer-rails', '~> 5.1'
gem 'bootstrap-sass', '~> 3.3'
gem 'bootstrap-switch-rails', '~> 3.3'
gem 'font-awesome-sass', '~> 4.3'
gem 'gemoji', '~> 2.1'
gem 'jquery-rails', '~> 4.0'
gem 'momentjs-rails', '~> 2.9'
gem 'selectize-rails', '~> 0.11'
gem 'zurb-ink-rails', '~> 1.0'

# Utilities
gem 'pry-rails', '~> 0.3'

# Rack servers
gem 'puma', '~> 2.11', require: false
gem 'unicorn', '~> 4.8', require: false

group :development do
  gem 'annotate', '~> 2.6'
  gem 'spring', '~> 1.2', require: false
  gem 'spring-commands-rspec', '~> 1.0', require: false
  gem 'web-console', '~> 2.0'
end

group :test do
  gem 'capybara', '~> 2.4', require: false
  gem 'coveralls', '~> 0.7', require: false
  gem 'database_cleaner', '~> 1.4', require: false
  gem 'json_spec', '~> 1.1', require: false
  gem 'rspec-rails', '~> 3.1', require: false
  gem 'simplecov', '~> 0.9', require: false
  gem 'simplecov-console', '~> 0.2', require: false
end

group :development, :test do
  gem 'bullet', '~> 4.14'
  gem 'factory_girl_rails', '~> 4.5', require: false
  gem 'faker', '~> 1.4', require: false
  gem 'poltergeist', '~> 1.5', require: false
  gem 'teaspoon', '~> 0.8'
end

group :console do
  gem 'awesome_print', '~> 1.6'
  gem 'colorize', '~> 0.7'
end

group :debugger do
  gem 'pry-byebug', '~> 2.0'
end

group :docs do
  gem 'kramdown', '~> 1.5'
  gem 'yard', '~> 0.8'
end

group :lint do
  gem 'inch', '~> 0.5'
  gem 'jshintrb', '~> 0.2'
  gem 'rubocop', '~> 0.29'
  gem 'scss-lint', '~> 0.32'
  gem 'therubyracer', '~> 0.12'
end
