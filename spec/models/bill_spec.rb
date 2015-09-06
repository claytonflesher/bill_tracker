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

  it "ensures the description is present" do
    bill = Bill.new(description: nil)
    expect(bill).not_to                      be_valid
    expect(bill.errors[:description]).not_to be_empty
  end
end
