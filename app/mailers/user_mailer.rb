class UserMailer < ApplicationMailer
  default from: "do_not_reply@billscribe.com"

  def verify(user)
    @user = user
    mail to: @user.email, subject: "[BillTracker] Verify Email"
  end

  def reset_password(user)
    @user = user
    mail to: @user.email, subject: "[BillTracker] Reset Password"
  end

  def send_update(user:, bill:)
    @user = user
    @bill = bill
    mail to: @user.email, subject: "[BillTracker] Update to #{@bill.name}"
  end
end
