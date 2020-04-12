# frozen_string_literal: true

require_relative 'boot'

require 'action_controller/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BrcobrancaExemplo
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.time_zone = ENV.fetch('TZ', 'Brasilia')

    config.i18n.enforce_available_locales = false
    config.i18n.default_locale = :"pt-BR"
    config.i18n.locale = :"pt-BR"
  end
end
