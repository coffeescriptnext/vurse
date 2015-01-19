require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

require 'support/rails'
require 'support/database_cleaner'
require 'support/factory_girl'
require 'support/bullet'
require 'support/json'
require 'support/devise'
require 'support/matchers'
