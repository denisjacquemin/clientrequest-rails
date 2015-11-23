class CreateFormTypes < ActiveRecord::Migration
  def change
    create_table :form_types do |t|
      t.string :label
      t.string :filename

      t.timestamps null: false
    end
  end
end
