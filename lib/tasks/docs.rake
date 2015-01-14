begin
  require 'yard/rake/yardoc_task'
  YARD::Rake::YardocTask.new(:docs)
rescue LoadError # rubocop:disable HandleExceptions
end
