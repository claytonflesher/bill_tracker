require 'rails_helper'

RSpec.describe UserProfile, type: :model do
  it "makes sure the street address is present" do
    profile = FactoryGirl.build(:user_profile, address: nil)
    expect(profile).not_to                  be_valid
    expect(profile.errors[:address]).not_to be_empty
  end

  it "has a senator" do
    profile = FactoryGirl.build(:user_profile, senator: nil)
    expect(profile).not_to                  be_valid
    expect(profile.errors[:senator]).not_to be_empty
  end

  it "has a representative" do
    profile = FactoryGirl.build(:user_profile, representative: nil)
    expect(profile).not_to                         be_valid
    expect(profile.errors[:representative]).not_to be_empty
  end

  it "has a senate district" do
    profile = FactoryGirl.build(:user_profile, senate_district: nil)
    expect(profile).not_to                          be_valid
    expect(profile.errors[:senate_district]).not_to be_empty
  end

  it "has a house district" do
    profile = FactoryGirl.build(:user_profile, house_district: nil)
    expect(profile).not_to                         be_valid
    expect(profile.errors[:house_district]).not_to be_empty
  end

  it "has a state" do
    profile = FactoryGirl.build(:user_profile, state: nil)
    expect(profile).not_to                 be_valid
    expect(profile.errors[:state]).not_to be_empty
  end
end
