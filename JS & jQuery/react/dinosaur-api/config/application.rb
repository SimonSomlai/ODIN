require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DinosaurApi
  class Application < Rails::Application
    config.middleware.insert_before 0, Rack::Cors do
       allow do
         origins '*'
         resource '*', :headers => :any, :methods => [:get, :post, :delete, :put, :patch]
       end
     end
    config.api_only = true
  end
end
