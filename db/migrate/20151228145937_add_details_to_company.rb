class AddDetailsToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :street, :string
    add_column :companies, :number, :string
    add_column :companies, :city, :string
    add_column :companies, :zip, :string
    add_column :companies, :box, :string
    add_column :companies, :phone, :string
    add_column :companies, :email, :string
    add_column :companies, :open_hours, :string
  end
end
