RSpec.configure do |config|
  config.around do |example|
    if Bullet.enable?
      Bullet.start_request
      example.run
      Bullet.perform_out_of_channel_notifications if Bullet.notification?
      Bullet.end_request
    else
      example.run
    end
  end
end
