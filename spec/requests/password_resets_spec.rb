require 'rails_helper'

RSpec.describe "PasswordResets", type: :request do
  it "resets a user's password and allows them to log in" do
    user = FactoryGirl.create(:user)
    expect(user.password_reset_token).to be_nil

    get "/reset_password"
    post_via_redirect("/reset_password", email: user.email)
    expect(path).to eq(signin_path)
    expect(flash[:notice]).to eq("An email has been sent to your inbox.")
    
    user = User.find(user.id)
    expect(user.password_reset_token).to_not be_nil

    get "/reset_password/#{user.password_reset_token}/edit"
    post_via_redirect(
      "/reset_password/#{user.password_reset_token}/edit", 
        password: "newpassword", 
        password_confirmation: "newpassword", 
        token: user.password_reset_token
      )
    assert_response(:success)
    expect(path).to eq(signin_path)
    expect(flash[:notice]).to eq("Password reset. Please sign in.")

    post_via_redirect("/signin", email: user.email, password: "newpassword")
    assert_response(:success)
    expect(path).to eq(root_path)
  end
end
