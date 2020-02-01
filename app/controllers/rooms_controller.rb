class RoomsController < ApplicationController
  include Common

  before_action :authenticate_user!
  before_action :require_profile

  def index
    @rooms = current_user.rooms.order(updated_at: :desc)
  end

  def show
    @entry = Entry.find_by(room_id: params[:id])
    if current_user.rooms.find_by(id: @entry.room_id)
      @room = Room.find(params[:id])
      @messages = @room.messages
    else
      redirect_back(fallback_location: root_path)
      flash[:alert] = '権限がありません'
    end
  end

  def create
    @room = Room.create
    @entry = @room.entries.build(entry_params)
    @entry.save
    redirect_to @room
  end

  protected

  def authenticate_user!
    return if job_offerer_signed_in? || job_seeker_signed_in?

    return authenticate_job_offerer! unless job_offerer_signed_in?

    return authenticate_job_seeker! unless job_seeker_signed_in?
  end

  def entry_params
    params.require(:entry).permit(
      :job_offerer_id,
      :job_seeker_id
    )
  end
end
