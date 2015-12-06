class FormMailer < ApplicationMailer
  def send_form_email(message)
    @message = message
    mail(to: @message.email,
         reply_to: @message.author.email,
         from: @message.author.email,
         subject: "#{@message.form.type.label}")
  end
end
