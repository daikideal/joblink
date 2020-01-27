module ApplicationHelper
  def correct_user?
    if job_offerer_signed_in?
      return true if @job_offerer == current_job_offerer
    elsif job_seeker_signed_in?
      return true if @job_seeker == current_job_seeker
    end
  end
end
