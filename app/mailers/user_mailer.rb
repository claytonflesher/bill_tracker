class UserMailer < ApplicationMailer
  default from: "claytonflesher@gmail.com"

  def verify(user)
    @user = user
    mail to: @user.email, subject: "[BillScribe] Verify Email"
  end

  def reset_password(user)
    @user = user
    mail to: @user.email, subject: "[BillScribe] Reset Password"
  end

  def send_update(user:, bill:)
    @user = user
    @bill = bill
    mail to: @user.email, subject: "[BillScribe] Update to #{@bill.name}"
  end
end
