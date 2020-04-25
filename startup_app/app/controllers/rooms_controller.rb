class RoomsController < ApplicationController
  # Loads:
  # @rooms = all rooms
  # @room = current room when applicable
  before_action :load_entities, :require_user

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def talk
    @room = Room.new
    @group = Group.new
    @room.group_id = @group.id
    @group.add(current_user,params[:id])
    if @room.save
      flash[:success] = "Room #{@room.name} was created successfully"
      redirect_to room_path(@room)
    else
      render 'pages/home'
    end
  end

  def create
    @room = Room.new(permitted_parameters)
    @group = Group.new
    @room.group_id = @group.id
    @group.add(current_user)
    if @room.save
      flash[:success] = "Room #{@room.name} was created successfully"
      redirect_to room_path(@room)
    else
      render :new
    end
  end

  def edit
  end

  def show
    @message = Message.new(room: @room)
    @room_messages = @room.message.includes(:user)
  end

  def update
    if @room.update_attributes(permitted_parameters)
      flash[:success] = "Room #{@room.name} was updated successfully"
      redirect_to rooms_path
    else
      render :new
    end
  end

  protected

  def load_entities
    @rooms = Room.all
    @room = Room.find(params[:id]) if params[:id]
  end

  def permitted_parameters
    params.require(:room).permit(:name)
  end
end