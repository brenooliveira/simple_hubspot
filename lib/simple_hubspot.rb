require "simple_hubspot/version"

require 'json'
require 'rest-client'
require 'logger'

require 'simple_hubspot/properties'

module SimpleHubspot
  def self.configure(settings = {})
    SimpleHubspot::Settings.configure(config)
  end

  require 'hubspot/railtie' if defined?(Rails)
end
