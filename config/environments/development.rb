Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = true

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.cache_store = :redis_store, ENV['REDIS_URL']
    config.public_file_server.headers = {
        'Cache-Control' => "public, max-age=#{2.days.seconds.to_i}"
      }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  config.session_store :redis_store, key: '_peatio_session', expire_after: ENV['SESSION_EXPIRE'].to_i.minutes

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false
  config.action_mailer.delivery_method = :file
  config.action_mailer.file_settings = { location: 'tmp/mails' }

  config.action_mailer.default_url_options = { :host => ENV["URL_HOST"] }

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true
  # Suppress logger output for asset requests.
  config.assets.quiet = true

  config.active_record.default_timezone = :local

  require 'middleware/i18n_js'
  require 'middleware/security'
  config.middleware.insert_before ActionDispatch::Static, Middleware::I18nJs
  config.middleware.insert_before Rack::Runtime, Middleware::Security

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
end
