class MessagesController < ApplicationController

  before_action :load_entities

  def create
    @room_message = Message.create(user: current_user, room: @room,
                                   message: params.dig(:room_message, :message))
  end

  protected

  def load_entities
    @room = Room.find(params.dig(:room_message, :room_id))
  end
end
