class ApplicationMailer < ActionMailer::Base
  default from: "omgod234@gmail.com"
  add_template_helper(SessionsHelper)
  layout "mailer"
end
