module RoomsHelper
  def both_present?
    return true if @room.job_offerer.present? && @room.job_seeker.present?
  end
end
