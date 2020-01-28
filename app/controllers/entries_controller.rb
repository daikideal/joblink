class EntriesController < ApplicationController
  def destroy
    @entry = current_user.entries.find_by(room_id: params[:id])
    if current_job_offerer == @entry.job_offerer
      @entry.update(job_offerer_id: nil)
    elsif current_job_seeker == @entry.job_seeker
      @entry.update(job_seeker_id: nil)
    end
    redirect_to rooms_path, notice: 'ルームを退出しました'
  end
end
