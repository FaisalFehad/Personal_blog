# For better error to work on Vagrant VM
BetterErrors::Middleware.allow_ip! "0.0.0.0/0"

Rails.application.configure do

  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.action_mailer.raise_delivery_errors = true
  config.consider_all_requests_local         = true
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.assets.debug = true
  config.assets.digest = true

  config.assets.raise_runtime_errors = true
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  config.action_mailer.perform_deliveries = true
  config.action_mailer.delivery_method = :smtp

  ActionMailer::Base.smtp_settings   = {
    address:              'smtp.sendgrid.net',
    from:                 'app52905832@heroku.com',
    port:                 '587',
    authentication:       :plain,
    user_name:            'app52905832@heroku.com',
    password:             'i1jqf0il2902',
    domain:               'heroku.com',
    enable_starttls_auto:  true
  }

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  config.action_controller.perform_caching = false
end
