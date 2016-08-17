require 'spec_helper'

describe SimpleHubspot::Properties do
  context ".add" do
    before do
      subject.add("name", "fake name").add("email", "fake@fake.com")
    end

    let(:json) { subject.to_json }

    it { expect(json).to include_json([{"name": "fake name"}]) }
    it { expect(json).to include_json([{"email": "fake@fake.com"}]) }
  end
end
