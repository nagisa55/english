require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module AppName
  class Application < Rails::Application
    config.load_defaults 5.2
    config.time_zone = "Asia/Tokyo"
    config.i18n.default_locale = :ja

    config.generators do |g|
      g.test_framework :rspec,
      fixtures: false,
      view_specs: false,
      helper_spec: false,
      routing_specs: false
    end
  end
end
