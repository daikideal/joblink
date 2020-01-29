class EntriesController < ApplicationController
  def destroy
    @entry = current_user.entries.find_by(room_id: params[:id])
    current_user.leave(@entry)
    @entry.nobody
    redirect_to rooms_path, notice: 'ルームを退出しました'
  end
end
