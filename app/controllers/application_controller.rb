class ApplicationController < ActionController::Base
  def current_user
    return current_job_offerer if job_offerer_signed_in?
    return current_job_seeker if job_seeker_signed_in?
  end
end
