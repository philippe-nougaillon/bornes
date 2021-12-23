require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Bornes
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.i18n.default_locale = :fr

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        # origins 'relax-en-zoe.herokuapp.com', 'localhost:3030'
        resource '*', headers: :any, methods: [:get]
      end
    end
    
  end
end
