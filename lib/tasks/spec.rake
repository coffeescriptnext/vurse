begin
  require 'rspec/core/rake_task'

  namespace :spec do
    COMPONENTS = %w(
      controllers
      features
      helpers
      interactors
      jobs
      lib
      mailers
      models
      policies
      responders
      routes
      serializers
      services
    )

    COMPONENTS.each do |component|
      desc "Run #{component} tests"
      RSpec::Core::RakeTask.new(component) do |t|
        t.pattern = "spec/#{component}/**/*_spec.rb"
      end
    end

    desc 'Run all unit tests'
    RSpec::Core::RakeTask.new(:unit) do |t|
      t.pattern = "spec/{#{(COMPONENTS - %w(features)).join(',')}}/**/*_spec.rb"
    end
  end

  desc 'Run all tests'
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = "spec/{#{COMPONENTS.join(',')}}/**/*_spec.rb"
  end
rescue LoadError # rubocop:disable HandleExceptions
end
