class FormsController < ApplicationController
  before_action :authenticate_user!

  def show
    @form = Form.find_by_uid(params[:id])
    render @form.type.filename
  end

  def new
    @form = Form.new
  end

  def create
    @form = Form.new
    @form.form_type = params[:type]
    render @form.type.filename
  end

  def index
    @forms = Form.all.by_company(current_user.company_id)
  end

end
