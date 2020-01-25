class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{params['room']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # ActionCable.server.broadcast 'room_channel', message: data['message']
    if current_job_offerer
      Message.create! content: data['message'], job_offerer_id: current_job_offerer.id, room_id: params['room']
    elsif current_job_seeker
      Message.create! content: data['message'], job_seeker_id: current_job_seeker.id, room_id: params['room']
    end
  end
end
