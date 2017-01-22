require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)

module Cemetery
  class Application < Rails::Application
    config.eager_load_paths << Rails.root.join('lib')
    config.time_zone = 'Europe/Ljubljana'
    config.active_record.default_timezone = :local
  end
end
