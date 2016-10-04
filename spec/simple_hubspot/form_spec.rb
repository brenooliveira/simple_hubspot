require 'spec_helper'

describe SimpleHubspot::Form do
  before :all do
    SimpleHubspot.configure do |config|
      config.hapikey = 'YOUR-OWN-API-KEY'
      config.portal_id = 'PORTAL_ID'
    end
  end

  context ".submit_form" do
    context 'when submit success' do
      before do
        stub_request(:post, "https://forms.hubspot.com/uploads/form/v2/PORTAL_ID/FORM_ID")
        .with(body: /^.*$/, headers: { "Content-Type" => "application/x-www-form-urlencoded" })
        .to_return(status: 204)

        @payload = { email: 'test@example.com', 
                    hs_context: { hutk: '60c2ccdfe4892f0fa0593940b12c11aa',
                                  ipAddress: '127.0.0.10',
                                  pageUrl: 'http://demo.hubapi.com/contact/',
                                  pageName: 'Contact Us' } }
      end
      let(:response) { SimpleHubspot::Form.submit_form 'FORM_ID', @payload }

      it { expect(response[:success]).to be_truthy }
    end

    context 'when submit invalid form GUID' do
      before do
        stub_request(:post, "https://forms.hubspot.com/uploads/form/v2/PORTAL_ID/FORM_ID")
        .with(body: /^.*$/, headers: { "Content-Type" => "application/x-www-form-urlencoded" })
        .to_return(status: 404)

        @payload = { email: 'test@example.com', 
                    hs_context: { hutk: '60c2ccdfe4892f0fa0593940b12c11aa',
                                  ipAddress: '127.0.0.10',
                                  pageUrl: 'http://demo.hubapi.com/contact/',
                                  pageName: 'Contact Us' } }
      end
      let(:response) { SimpleHubspot::Form.submit_form 'FORM_ID', @payload }

      it { expect(response[:success]).to be_falsy }
    end

    context 'when form GUID is nil' do
      it { expect { SimpleHubspot::Form.submit_form nil, {} }.to raise_error ArgumentError }
    end
  end
end
