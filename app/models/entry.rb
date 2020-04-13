# frozen_string_literal: true

class Entry < ApplicationRecord
  belongs_to :job_offerer, optional: true
  belongs_to :job_seeker, optional: true
  belongs_to :room

  def nobody
    return unless job_offerer_id.blank? && job_seeker_id.blank?

    room.destroy
  end
end
