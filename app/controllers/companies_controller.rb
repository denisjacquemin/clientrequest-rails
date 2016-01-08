class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company, only: [:edit, :update]

  def edit
  end

  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to edit_company_path, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @deleteme }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end

  end

  private
    def set_company
      @company = Company.find(current_user.company_id)
    end

    def company_params
      params.require(:company).permit(:name, :street, :number, :city, :zip, :box, :phone, :email, :open_hours)
    end
end
