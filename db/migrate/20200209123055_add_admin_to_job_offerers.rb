class AddAdminToJobOfferers < ActiveRecord::Migration[6.0]
  def change
    add_column :job_offerers, :admin, :boolean, default: false
  end
end
