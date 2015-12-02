class FormMailer < ApplicationMailer
  def send_form_email(message)
    @message = message
    mail(to: @message.email, subject: 'Welcome to My Awesome Site')
  end
end
