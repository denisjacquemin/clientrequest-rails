class FormMailer < ApplicationMailer
  def send_form_email(message)
    @message = message
    mail(to: @message.to,
         reply_to: @message.from,
         from: @message.from,
         subject: "#{@message.form.type.label}")
  end
end
