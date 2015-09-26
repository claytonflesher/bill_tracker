require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  it "creates new users" do
    attributes = FactoryGirl.attributes_for(:user)
    profile    = FactoryGirl.attributes_for(:user_profile)
    attributes[:address] = profile[:address]
    expect(User.find_by(email: attributes[:email])).to be_nil
    post :create, attributes
    assert_response(:redirect)
    expect(User.find_by(email: attributes[:email])).not_to be_nil
  end

  it "returns the form if there are errors" do
    attributes = FactoryGirl.attributes_for(:user)
    profile    = FactoryGirl.attributes_for(:user_profile)
    attributes[:address] = profile[:address]
    attributes[:password_confirmation] = ""
    expect(User.find_by(email: attributes[:email])).to be_nil
    post :create, attributes
    assert_response(:redirect)
    user = assigns[:user]
    expect(user.email).to eq(attributes[:email])
    expect(User.find_by(email: attributes[:email])).to be_nil
  end
end
