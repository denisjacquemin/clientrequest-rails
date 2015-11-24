class FormsController < ApplicationController
  def show
    @form = Form.find_by_uid(params[:uid])
    render @form.form_type.filename
  end

  def new
    @form = Form.new
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
