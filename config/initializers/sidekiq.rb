Sidekiq.configure_server do |config|
  case Rails.env
    when 'production' then
      config.redis = { url: '', namespace: 'sidekiq' }
    when 'test' then
      config.redis = { url: '', namespace: 'sidekiq_test' }
    else
      config.redis = { url: 'redis://redis:6379', namespace: 'sidekiq_dev' }
  end
end

Sidekiq.configure_client do |config|
  case Rails.env
    when 'production' then
      config.redis = { url: '', namespace: 'sidekiq' }
    when 'test' then
      config.redis = { url: '', namespace: 'sidekiq_test' }
    else
      config.redis = { url: 'redis://redis:6379', namespace: 'sidekiq_dev' }
  end
end
