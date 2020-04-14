# frozen_string_literal: true

class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.references :job_offerer, foreign_key: true
      t.references :job_seeker, foreign_key: true
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
