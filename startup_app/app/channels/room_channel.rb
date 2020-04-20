class RoomChannel < ApplicationCable::Channel

  def subscribed
    byebug
    room = Room.find(params[:room][:id])
    stream_for room
      # stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
