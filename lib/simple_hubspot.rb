require "simple_hubspot/version"

require 'ostruct'
require 'json'
require 'rest-client'
require 'logger'

require 'simple_hubspot/utils'
require 'simple_hubspot/api_client'
require 'simple_hubspot/contact'
require 'simple_hubspot/form'

module SimpleHubspot

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :hapikey, :api_base, :portal_id, :form_submit_base

    def initialize
      @hapikey = ''
      @portal_id = ''
      @api_base = 'https://api.hubapi.com'
      @form_submit_base = 'https://forms.hubspot.com/uploads/form/v2/'
    end
  end

  require 'simple_hubspot/railtie' if defined?(Rails)
end
