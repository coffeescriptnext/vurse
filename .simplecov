# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'coveralls'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::Console,
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start 'rails' do
  coverage_dir 'coverage/ruby'

  add_filter 'vendor/bundle'

  add_group 'Interactors', 'app/interactors'
  add_group 'Jobs', 'app/jobs'
  add_group 'Policies', 'app/policies'
  add_group 'Responders', 'app/responders'
  add_group 'Serializers', 'app/serializers'
  add_group 'Services', 'app/services'
end
