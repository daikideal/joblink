# frozen_string_literal: true

class CreateResumes < ActiveRecord::Migration[6.0]
  def change
    create_table :resumes do |t|
      t.references :job_seeker, null: false, foreign_key: { on_delete: :cascade }
      t.text :content

      t.timestamps
    end
  end
end
