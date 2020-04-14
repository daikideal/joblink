# frozen_string_literal: true

module ApplicationHelper
  def current_user
    if job_offerer_signed_in?
      current_job_offerer
    elsif job_seeker_signed_in?
      current_job_seeker
    end
  end

  def correct_user?
    if job_offerer_signed_in?
      return true if @job_offerer == current_job_offerer
    elsif job_seeker_signed_in?
      return true if @job_seeker == current_job_seeker
    end
  end

  def room?
    return true if controller.controller_name == 'rooms' &&
                   controller.action_name == 'show'
  end

  def user_signed_in?
    return true if job_offerer_signed_in? || job_seeker_signed_in?
  end
end
