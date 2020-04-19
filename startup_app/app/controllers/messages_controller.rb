class MessagesController < ApplicationController

  before_action :load_entities


  def create
    @message = Message.create(user: current_user, room: @room,
                                   message: params.dig(:message, :message))
  end

  protected

  def load_entities
    @room = Room.find(params.dig(:message, :room_id))
  end
end
