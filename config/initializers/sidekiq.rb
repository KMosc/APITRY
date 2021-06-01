Sidekiq.configure_server do |config|
  config.redis = { url: "redis://#{ENV['REDIS_PORT_6379_TCP_ADDR']}:#{ENV['REDIS_PORT_6379_TCP_PORT']}/0", namespace: 'Tyresearch' }
end
Sidekiq.configure_client do |config|
  config.redis = { url: "redis://#{ENV['REDIS_PORT_6379_TCP_ADDR']}:#{ENV['REDIS_PORT_6379_TCP_PORT']}/0", namespace: 'Tyresearch' }
end
Sidekiq::Extensions.enable_delay!