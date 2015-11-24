class AddCompanyIdToForms < ActiveRecord::Migration
  def change
    add_column :forms, :company_id, :integer
  end
end
