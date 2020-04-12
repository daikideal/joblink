# frozen_string_literal: true

class RemoveResumeFromJobSeekerProfile < ActiveRecord::Migration[6.0]
  def change
    remove_column :job_seeker_profiles, :resume, :text
  end
end
