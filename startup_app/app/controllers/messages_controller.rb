class MessagesController < ApplicationController

  before_action :load_entities


  def create
    @message = Message.create(user: current_user, room: @room,
                                   message: params[:message][:message])

    RoomChannel.broadcast_to @room, @message
      #ActionCable.server.Broadcast "room_channel", foo: @message.body

  end

  protected

  def load_entities
    #byebug
    @room = Room.find(params[:message][:room_id])
  end
end
