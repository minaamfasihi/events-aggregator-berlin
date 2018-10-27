Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost:6379/0' }

  # config.on(:startup) do
  #   Sidekiq.schedule = YAML.load_file(File.expand_path('../../sidekiq.yml', __FILE__))
  #   SidekiqScheduler::Scheduler.instance.reload_schedule!
  # end
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:6379/0' }
end
