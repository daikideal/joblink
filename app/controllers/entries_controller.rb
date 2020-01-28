class EntriesController < ApplicationController
  def destroy
    @entry = current_user.entries.find_by(room_id: params[:id])
    if job_offerer_signed_in?
      @entry.update(job_offerer_id: nil)
    elsif job_seeker_signed_in?
      @entry.update(job_seeker_id: nil)
    end
    @entry.nobody
    redirect_to rooms_path, notice: 'ルームを退出しました'
  end
end
