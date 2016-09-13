require "simple_hubspot/version"

require 'ostruct'
require 'json'
require 'rest-client'
require 'logger'

require 'simple_hubspot/utils'
require 'simple_hubspot/api_client'
require 'simple_hubspot/contact'
require 'simple_hubspot/generators/simple_hubspot/simple_hubspot_generator'

module SimpleHubspot

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :hapikey, :api_base

    def initialize
      @hapikey = ''
      @api_base = 'https://api.hubapi.com'
    end
  end

  require 'simple_hubspot/railtie' if defined?(Rails)
end
