class AddEmailAndMessageToForms < ActiveRecord::Migration
  def change
    add_column :forms, :to, :string
    add_column :forms, :from, :string
    add_column :forms, :message, :text
  end
end
