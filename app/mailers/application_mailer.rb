class ApplicationMailer < ActionMailer::Base
  default from: "do_not_reply@billscribe.com"
  layout 'mailer'
end
