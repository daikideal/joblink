class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.references :job_seeker, null: false
      t.references :job_posting, null: false

      t.timestamps
    end

    add_index :bookmarks, :job_seeker_id
    add_index :bookmarks, :job_posting_id
  end
end
