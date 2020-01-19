class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{params['room']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # ActionCable.server.broadcast 'room_channel', message: data['message']
    if job_offerer_signed_in?
      Message.create! content: data['message'], job_offerer_id: current_job_offerer.id, room_id: ['room']
    else
      Message.create! content: data['message'], job_seeker_id: current_job_seeker.id, room_id: ['room']
    end
  end
end
