class CreateJobSeekerProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :job_seeker_profiles do |t|
      t.references :job_seeker, null: false, foreign_key: { on_delete: :cascade }
      t.string :first_name
      t.string :last_name
      t.string :first_name_furigana
      t.string :last_name_furigana
      t.text :bio
      t.text :resume

      t.timestamps
    end
  end
end
