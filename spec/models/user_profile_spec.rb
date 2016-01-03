require 'rails_helper'

RSpec.describe UserProfile, type: :model do
  before(:all) do
    Geocoder.configure(:lookup => :test)

    Geocoder::Lookup::Test.add_stub(
      "111 E Bay St., OKC, OK 73120", [
        {
          'latitude'  => 0,
          'longitude' => 0
        }
      ]
    )
  end
  it "makes sure the street address is present" do
    profile = FactoryGirl.build(:user_profile, address: nil)
    expect(profile).not_to                  be_valid
    expect(profile.errors[:address]).not_to be_empty
  end
end
