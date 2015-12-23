class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.string :to
      t.integer :author_id
      t.integer :form_id
      t.boolean :form_as_pdf

      t.timestamps null: false
    end
  end
end
