class ApplicationMailer < ActionMailer::Base
  default to: "hello@cineview.com", from: 'hello@cineview.com'
  layout 'mailer'
end
