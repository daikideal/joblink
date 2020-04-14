# frozen_string_literal: true

class AddAdminToJobSeekers < ActiveRecord::Migration[6.0]
  def change
    add_column :job_seekers, :admin, :boolean, default: false
  end
end
