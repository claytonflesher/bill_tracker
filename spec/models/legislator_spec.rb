require "rails_helper"

RSpec.describe Legislator, type: :model do
  before(:each) do
    @json = OpenStatesWrapper.call(
      call_type: :geo_lookup,
      url_parameters: {
        "long" => "-74.04450039999999",
        "lat"  => "40.6892494"
      }
    )
    @legislator = Legislator.new(json: @json, chamber: :lower)
  end

  describe "Legislator" do
    it "has a chamber" do
      expect(@legislator.chamber).to eq("lower")
    end

    it "has a first name" do
      expect(@legislator.first_name).to_not be_empty
    end

    it "can have a middle name, but might be an empty string" do
      expect(@legislator.middle_name).to_not be_nil
    end

    it "has a last_name" do
      expect(@legislator.last_name).to_not be_empty
    end

    it "has a full name" do
      expect(@legislator.full_name).to_not be_empty
    end

    it "has a district" do
      expect(@legislator.district).to_not be_empty
    end

    it "has a state" do
      expect(@legislator.state).to_not be_empty
    end

    it "has committees" do
      expect(@legislator.committees[0]).to_not be_empty
    end

    it "has an email" do
      expect(@legislator.email).to_not be_empty
    end

    it "has a party" do
      expect(@legislator.party).to_not be_empty
    end

    it "has a leg_id" do
      expect(@legislator.leg_id).to_not be_empty
    end

    it "has a url" do
      expect(@legislator.url).to_not be_empty
    end

    it "has a phone number" do
      expect(@legislator.phone).to_not be_empty
    end

    it "has an address" do
      expect(@legislator.address).to_not be_empty
    end
  end
end
