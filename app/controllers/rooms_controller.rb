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
      redirect_back(fallback_location: root_path, alert: '権限がありません')
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

    redirect_to root_url, alert: 'この機能はログインが必要です'
  end

  def entry_params
    params.require(:entry).permit(
      :job_offerer_id,
      :job_seeker_id
    )
  end
end
