class ApplicationMailer < ActionMailer::Base
  default from: "admin@mail.billscribe.com"
  layout 'mailer'
end
