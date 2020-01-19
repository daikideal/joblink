class AddUserRefToMessages < ActiveRecord::Migration[6.0]
  def change
    add_reference :messages, :job_offerer, foreign_key: true
    add_reference :messages, :job_seeker, foreign_key: true
    add_reference :messages, :room, foreign_key: true

    change_column_null :messages, :room_id, false
  end
end
