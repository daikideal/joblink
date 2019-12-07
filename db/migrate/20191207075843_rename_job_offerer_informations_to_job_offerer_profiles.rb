class RenameJobOffererInformationsToJobOffererProfiles < ActiveRecord::Migration[6.0]
  def change
    rename_table :job_offerer_informations, :job_offerer_profiles
  end
end
