class FormMailer < ApplicationMailer
  def send_form_email(message)
    @message = message
    company = @message.form.company
    options = {
      header: {
        left: Time.now.strftime("%d-%m-%Y"),
        center: "#{company.name}",
        right: '[page] / [topage]'
      },
      footer: {
        center: "#{company.number} #{company.street} #{company.zip} #{company.city} - #{company.phone}"
      }
    }
    if @message.form_as_pdf # show_for_pdf_url(@message.form.uid, as_pdf: 'true')
      pdf = WickedPdf.new.pdf_from_url(show_for_pdf_url(@message.form.uid), options)
      attachments["#{@message.form.type.label}.pdf"] = pdf
    end

    mail(to: @message.to,
         reply_to: @message.author.email,
         from: @message.author.email,
         subject: "#{@message.form.type.label}")
  end
end
