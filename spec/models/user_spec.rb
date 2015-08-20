require 'rails_helper'

RSpec.describe User, type: :model do
  it "makes sure the email is present" do 
    user = User.new(email: nil)
    expect(user).not_to        be_valid
    expect(user.errors[:email]).not_to be_empty
  end

  it "ensure the email is well-formed" do
    user = User.new(email: "bad fake email")
    expect(user).not_to        be_valid
    expect(user.errors[:email]).not_to be_empty
  end
end
