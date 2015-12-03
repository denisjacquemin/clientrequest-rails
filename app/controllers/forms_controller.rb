class FormsController < ApplicationController
  before_action :authenticate_user!

  def index
    @forms = Form.all.by_company(current_user.company_id)
    @form = Form.new
    @types = FormType.all
  end

  def show
    @form = Form.find_by_uid(params[:id])
    @message = Message.new
    render "forms/templates/#{@form.type.filename}"
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
    # new_firebase_form_key = FirebaseRef.push('forms', {}) # generate new firebase key (form.uid) under /forms path
    # @form.uid = new_firebase_form_key.body['name'] # assign key as uid form
    @form.uid = '98934j3493434jk43s'

    if @form.save
      redirect_to form_url(@form.uid) # redirect to show screen
    else
      @types = FormType.all
      render :new
    end
  end

  def send_by_email
    @message = Message.new(message_params)
    @message.save
    
    FormMailer.send_form_email(@message).deliver_later
  end

  def emails_sent
    @messages = Message.all
  end

  private

     # Never trust parameters from the scary internet, only allow the white list through.
     def form_params
       params.require(:form).permit(:type_id, :email, :message)
     end

     def message_params
       params.require(:message).permit(:email, :content, :author_id, :form_uid, :form_as_pdf)
     end

end
