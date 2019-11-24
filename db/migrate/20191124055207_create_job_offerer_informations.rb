class CreateJobOffererInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :job_offerer_informations do |t|
      t.references :job_offerer, null: false, foreign_key: { on_delete: :cascade }
      t.string :first_name
      t.string :last_name
      t.string :first_name_furigana
      t.string :last_name_furigana
      t.text :profile

      t.timestamps
    end
  end
end
