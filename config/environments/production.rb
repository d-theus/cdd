Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.serve_static_assets = false
  config.assets.js_compressor = :uglifier
  config.assets.compile = false
  config.assets.digest = true
  config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx
  # config.cache_store = :mem_cache_store
  # config.action_controller.asset_host = "http://assets.example.com"
  # config.action_mailer.raise_delivery_errors = false
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  #config.log_formatter = ::Logger::Formatter.new
  config.log_level = :info
  #config.logger = ActFluentLoggerRails::Logger.new
  config.logger = ::Logger.new(STDOUT)
  config.lograge.enabled = true
  config.lograge.formatter = Lograge::Formatters::Json.new
  config.active_record.dump_schema_after_migration = false
end
