require 'rails_helper'

RSpec.describe "Verifications", type: :request do
  it "verifies users" do
    user = FactoryGirl.create(:user)
    user.verified_at = nil
    user.save!
    expect(user.verified_at).to be_nil

    get "/verify/#{user.id}"
    assert_response(:success)
    
    email = ActionMailer::Base.deliveries.last
    expect(email).not_to be_nil
    link  = email.body.to_s[/^https?:\/\/[^\/]+(\/\S+)/, 1]

    get_via_redirect link
    assert_response(:success)
    expect(path).to eq(signin_path)

    expect(user.reload.verified_at).not_to be_nil
  end
end
