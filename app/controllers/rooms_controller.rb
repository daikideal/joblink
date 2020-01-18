class RoomsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @messages = Message.all
  end

  protected

  def authenticate_user!
    return if job_offerer_signed_in? || job_seeker_signed_in?

    return authenticate_job_offerer! unless job_offerer_signed_in?

    return authenticate_job_seeker! unless job_seeker_signed_in?
  end
end
