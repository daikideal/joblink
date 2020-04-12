# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def current_user
    if job_offerer_signed_in?
      current_job_offerer
    elsif job_seeker_signed_in?
      current_job_seeker
    end
  end
end
