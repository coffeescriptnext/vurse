worker_processes Integer(ENV.fetch('WEB_CONCURRENCY', 3))
timeout 15
preload_app true

before_fork do |_, _|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill('QUIT', Process.pid)
  end

  ActiveRecord::Base.connection.disconnect! if defined?(ActiveRecord::Base)
end

after_fork do |_, _|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing'
  end

  ActiveRecord::Base.establish_connection if defined?(ActiveRecord::Base)
end
