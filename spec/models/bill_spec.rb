require 'rails_helper'

RSpec.describe Bill, type: :model do
  it "makes sure the name is present" do
    bill = Bill.new(name: nil)
    expect(bill).not_to               be_valid
    expect(bill.errors[:name]).not_to be_empty
  end

  it "ensures the name is well-formed" do
    bill = Bill.new(name: "invalid name")
    expect(bill).not_to               be_valid
    expect(bill.errors[:name]).not_to be_empty
  end

  it "ensure the bill is unique to that user" do
    bill1      = FactoryGirl.create(:bill)
    bill1.user = FactoryGirl.create(:user)
    bill2      = Bill.new(name: bill1.name)
    bill1.user = bill1.user
    expect(bill1).to                   be_valid
    expect(bill2).not_to               be_valid
  end
end
