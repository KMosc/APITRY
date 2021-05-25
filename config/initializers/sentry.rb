Sentry.init do |config|
  config.dsn = 'https://c34e99bc0c6842e899b54a007890f077@o722080.ingest.sentry.io/5781587'
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  # Set tracesSampleRate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production
  config.traces_sample_rate = 0.5
  # or
  config.traces_sampler = lambda do |context|
    true
  end
end
