class FormsController < ApplicationController
  def show
    @form = Form.find_by_uid(params[:formid])
    render @form.form_type.filename
  end

  def create
    @form = Form.new
    @form.form_type = params[:type]
    render @form.form_type.filename
  end

  def index
    @forms = Form.all
  end
end
