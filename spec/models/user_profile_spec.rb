require 'rails_helper'

RSpec.describe UserProfile, type: :model do
  it "makes sure the street address is present" do
    profile = FactoryGirl.build(:user_profile, address: nil)
    expect(profile).not_to                  be_valid
    expect(profile.errors[:address]).not_to be_empty
  end
end
