class ApplicationMailer < ActionMailer::Base
  default from: ActionMailer::Base.smtp_settings[:user_name]

  layout 'mailer'

  def new_order(email)
    mail(to: email, subject: 'new order')
  end
end
