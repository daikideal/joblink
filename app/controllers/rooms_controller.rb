class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rooms = Room.all.order(updated_at: :desc)
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
  end

  def create
    @room = Room.create
    redirect_to @room
  end

  protected

  def authenticate_user!
    return if job_offerer_signed_in? || job_seeker_signed_in?

    return authenticate_job_offerer! unless job_offerer_signed_in?

    return authenticate_job_seeker! unless job_seeker_signed_in?
  end
end
