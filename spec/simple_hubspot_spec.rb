require 'spec_helper'

describe SimpleHubspot do
  context ".configure" do
    before do
      SimpleHubspot.configure do |config|
        config.hapikey  = 'YOUR-OWN-API-KEY'
        config.api_base = 'http://any.other.host'
      end
    end

    it { expect(SimpleHubspot.configuration.hapikey).to eq 'YOUR-OWN-API-KEY' }
    it { expect(SimpleHubspot.configuration.api_base).to eq 'http://any.other.host' }
  end
end
