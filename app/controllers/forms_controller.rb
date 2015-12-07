class FormsController < ApplicationController
  before_action :authenticate_user!, except: :show

  def index
    @forms = Form.all.by_company(current_user.company_id)
    @form = Form.new
    @types = FormType.all
  end

  def show
    @form = Form.find_by_uid(params[:id])
    @message = Message.new
    @messages = Message.by_form(@form.id)

    respond_to do |format|
      format.html do
        render "forms/templates/#{@form.type.filename}"
      end
      format.pdf do
        render :pdf => "file_name",
               :template => "forms/templates/#{@form.type.filename}",
               :layout => "application_pdf.html.erb",
               :javascript_delay => 2000
      end
    end
  end

  def new
    @form = Form.new
    @types = FormType.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @form = Form.new(form_params)

    @form.author_id = current_user.id
    @form.company_id = current_user.company_id
    new_firebase_form_key = FirebaseRef.push('forms', {}) # generate new firebase key (form.uid) under /forms path
    @form.uid = new_firebase_form_key.body['name'] # assign key as uid form
    #@form.uid = '98934j3493434jk43s' + Date.new().to_s

    if @form.save
      redirect_to form_url(@form.uid) # redirect to show screen
    else
      @types = FormType.all
      render :new
    end
  end

  def create_send_form_message
    @message = Message.new(message_params)
    @message.save
    @messages = Message.by_form(@message.form_id)


    FormMailer.send_form_email(@message).deliver_later
  end

  # def emails_sent_by_form
  #   @messages = Message.by_form(params[:form_id])
  # end

  private

     # Never trust parameters from the scary internet, only allow the white list through.
     def form_params
       params.require(:form).permit(:type_id, :email, :message)
     end

     def message_params
       params.require(:message).permit(:email, :content, :author_id, :form_id, :form_as_pdf)
     end

end
