class UserMailer < ApplicationMailer
  default from: "do_not_reply@bill_tracker.com"

  def verify(user)
    @user = user
    mail to: @user.email, subject: "[BillTracker] Verify Email"
  end

  def reset_password(user)
    @user = user
    mail to: @user.email, subject: "[BillTracker] Reset Password"
  end

  def send_update(user:, description:)
    @user = user
    mail to: @user.email, subject: "[BillTracker] Status Update"
  end
end
