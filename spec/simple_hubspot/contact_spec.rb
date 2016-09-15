require 'spec_helper'

describe SimpleHubspot::Contact do
  before :all do
    SimpleHubspot.configure do |config|
      config.hapikey = 'YOUR-OWN-API-KEY'
    end
  end

  context ".create_or_update" do
    context 'when success on create contact' do
      before do
        stub_request(:post, "https://api.hubapi.com/contacts/v1/contact/createOrUpdate/email/email@simplehubspot.com?hapikey=YOUR-OWN-API-KEY")
        .with(body: /^.*$/, headers: { "Content-Type" => "application/json" })
        .to_return(body: '{ "vid": "1234" }')
      end

      let(:response) do
        params = { email: 'email@simplehubspot.com', name: 'breno oliveira', github: 'brenooliveira', twitter: 'brenoholivira' }
        SimpleHubspot::Contact.create_or_update 'email@simplehubspot.com', params
      end

      it { expect(response[:success]).to be_truthy }
      it { expect(response[:vid]).to eq '1234' }
    end

    context 'when fail on create contact' do
      before do
        stub_request(:post, "https://api.hubapi.com/contacts/v1/contact/createOrUpdate/email/email@simplehubspot.com?hapikey=YOUR-OWN-API-KEY")
        .with(body: /^.*$/, headers: { "Content-Type" => "application/json" })
        .to_return(status: 400, body: '{"status":"error","message":"Invalid JSON input: No content to map due to end-of-input","correlationId":"455a5308","requestId":"fabc6e62"}')
      end
      let(:response) { SimpleHubspot::Contact.create_or_update 'email@simplehubspot.com', {email: ""} }

      it { expect(response[:status]).to eq 'error' }
      it { expect(response[:success]).to be_falsy }
    end
  end

  context ".find_by_email" do
    context "when found a contact" do
      before do
        stub_request(:get, "https://api.hubapi.com/contacts/v1/contact/email/email@simplehubspot.com/profile?hapikey=YOUR-OWN-API-KEY").to_return(status: 200, body: load_json('contact'))
      end

      let(:response) { SimpleHubspot::Contact.find_by_email 'email@simplehubspot.com' }

      it { expect(response[:"portal-id"]).to eq 253924 }
      it { expect(response[:success]).to be_truthy }

    end

    context "when not found a contact" do
      before do
        stub_request(:get, "https://api.hubapi.com/contacts/v1/contact/email/email@simplehubspot.com/profile?hapikey=YOUR-OWN-API-KEY").to_return(status: 400, body: '{"status":"error","message":"contact does not exist","correlationId":"1d3c8cf7-8a1c-43e7-9b9f-4cad34ee809b","requestId":"cba78427-64a2-4f28-a8a7-1c2c97a156bc"}')
      end

      let(:response) { SimpleHubspot::Contact.find_by_email 'email@simplehubspot.com' }

      it { expect(response[:status]).to eq 'error' }
      it { expect(response[:success]).to be_falsy }
    end
  end

  context '.update' do
    context 'when update success' do
      before do
        stub_request(:post, "https://api.hubapi.com/contacts/v1/contact/vid/1234/profile?hapikey=YOUR-OWN-API-KEY").with(body: /^.*$/, headers: { "Content-Type" => "application/json" }).to_return(status: 204)
      end

      let(:response) { SimpleHubspot::Contact.update 1234, { email: "test@gmail.com" } }

      it { expect(response[:success]).to be_truthy }
    end

    context 'when fail update' do
      before do
        stub_request(:post, "https://api.hubapi.com/contacts/v1/contact/vid/1234/profile?hapikey=YOUR-OWN-API-KEY").with(body: /^.*$/, headers: { "Content-Type" => "application/json" }).to_return(status: 400)
      end

      let(:response) { SimpleHubspot::Contact.update 1234, { missing_field: "any_value" } }

      it { expect(response[:success]).to be_falsy }
    end

    context 'when vid is nil' do
      it { expect { SimpleHubspot::Contact.update(nil, {}) }.to raise_error ArgumentError }
    end
  end
end
