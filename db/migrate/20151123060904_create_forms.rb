class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :uid
      t.integer :form_type_id
      t.integer :author_id

      t.timestamps null: false
    end
  end
end
