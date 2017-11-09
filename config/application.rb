require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ffmpeg
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = 'Asia/Tokyo'
    config.active_record.default_timezone = :local
    config.i18n.available_locales =  [:ja, :en]
    config.i18n.enforce_available_locales = true
    config.i18n.default_locale = :ja
    config.i18n.locale = :ja
    config.i18n.fallbacks = {:ja => :en}

    config.log_formatter = proc do |severity, datetime, progname, msg|
      "[#{severity}]#{datetime}: #{progname} : #{msg}\n"
    end
    config.action_controller.action_on_unpermitted_parameters = :raise
  end
end
