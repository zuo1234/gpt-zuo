# 这里的地址和端口号(1643)都需要配置成正确的
Sidekiq.configure_server do |config|
  config.redis = { url: Settings.sidekiq_redis.url, password: Settings.sidekiq_redis.password }
end
Sidekiq.configure_client do |config|
  config.redis = { url: Settings.sidekiq_redis.url, password: Settings.sidekiq_redis.password }
end

# schedule_file = File.join(Rails.root, "config/scheduler/#{Rails.env}.yml")

# if Sidekiq.server? && File.exists?(schedule_file)
#   Sidekiq::Cron::Job.load_from_hash!(YAML.load_file(schedule_file) || {})
# end
