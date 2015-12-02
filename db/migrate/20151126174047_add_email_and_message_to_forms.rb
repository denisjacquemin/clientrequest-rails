class AddEmailAndMessageToForms < ActiveRecord::Migration
  def change
    add_column :forms, :email, :string
    add_column :forms, :message, :text
  end
end
