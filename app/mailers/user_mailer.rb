class UserMailer < ApplicationMailer
  default from: "do_not_reply@bill_tracker.com"

  def verify(user)
    @user = user
    mail to: @user.email, subject: "[BillTracker] Verify Email"
  end
end
