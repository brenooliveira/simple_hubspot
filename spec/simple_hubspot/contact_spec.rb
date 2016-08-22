require 'spec_helper'

describe SimpleHubspot::Contact do
  before do
    SimpleHubspot.configure do |config|
      config.hapikey = 'YOUR-OWN-API-KEY'
    end

    stub_request(:post, "https://api.hubapi.com/contacts/v1/contact/createOrUpdate/email?hapikey=YOUR-OWN-API-KEY")
      # .with(body: /^.*$/, headers: { "Content-Type" => "application/json" })
      # .to_return(body: "blabla")
  end

  context ".create_or_update" do
    let(:response) do
      params = { email: 'email@simplehubspot.com', name: 'breno oliveira', github: 'brenooliveira', twitter: 'brenoholivira' }
      SimpleHubspot::Contact.create_or_update 'email@simplehubspot.com', params
    end

    it { expect(response.code).to eq 200 }
  end
end
