class CreateJobPostings < ActiveRecord::Migration[6.0]
  def change
    create_table :job_postings do |t|
      t.references :job_offerer, null: false, foreign_key: { on_delete: :cascade }
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
