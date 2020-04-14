# frozen_string_literal: true

class ChangeColumnToJobOffererProfiles < ActiveRecord::Migration[6.0]
  def change
    rename_column :job_offerer_profiles, :profile, :bio
  end
end
