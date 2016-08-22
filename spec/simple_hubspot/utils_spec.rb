require 'spec_helper'

describe SimpleHubspot::Utils do
  context ".hash_to_properties" do
    let(:contact) do
      {
        name: "Breno",
        last_name: "Oliveira",
        twitter: "brenoholiveira"
      }
    end

    let(:properties) do
      described_class.hash_to_properties contact
    end

    it { expect(properties.size).to eq 3 }
    it { expect(properties).to include({"property"=>"name", "value"=>"Breno"}) }
    it { expect(properties).to include({"property"=>"last_name", "value"=>"Oliveira"}) }
    it { expect(properties).to include({"property"=>"twitter", "value"=>"brenoholiveira"}) }

  end
end
