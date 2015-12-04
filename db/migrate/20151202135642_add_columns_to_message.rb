class AddColumnsToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :author_id, :integer
    add_column :messages, :form_id, :integer
    add_column :messages, :form_as_pdf, :boolean
  end
end
