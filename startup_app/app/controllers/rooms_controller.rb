class RoomsController < ApplicationController
  # Loads:
  # @rooms = all rooms
  # @room = current room when applicable
  before_action :require_user

  def index
    @groups = Group.with_member(current_user)
    @rooms = []
    @groups.each do |group|
      @rooms << Room.find_by(group_id: group.id)
    end
  end
  #
  # def new
  #   @room = Room.new()
  # end

  def talk
    if current_user.id == params[:id].to_i
      flash[:warning] = "Sorry sir, You don't need technology to talk with yourself!"
      redirect_to rooms_path and return
    end
    if current_user.shares_any_group?(User.find(params[:id]))
      @room = Room.find_by(name: "#{User.find(params[:id]).fname} #{current_user.id}")
      if @room
        @group = Group.find_by(room_id: @room.id)
      else
        @room = Room.find_by(name: "#{current_user.fname} #{User.find(params[:id]).id}")
        @group = Group.find_by(room_id: @room.id)
      end
      redirect_to room_path(@room)
    else
      @room = Room.new(name: "#{User.find(params[:id]).fname} #{current_user.id}")
      @group = Group.new()
      if @room.save
        @group.room_id = @room.id
        @group.add(current_user,User.find(params[:id]))
        @room.group_id = @group.id
        @group.save
        flash[:success] = "Room #{@room.name} was created successfully"
        redirect_to room_path(@room)
      else
        redirect_to root_path
      end
    end
  end
  #
  # def create
  #   @room = Room.new(permitted_parameters)
  #   @group = Group.new
  #   @room.group_id = @group.id
  #   @group.add(current_user)
  #   if @room.save
  #     flash[:success] = "Room #{@room.name} was created successfully"
  #     redirect_to room_path(@room)
  #   else
  #     render :new
  #   end
  # end

  def edit
  end

  def show
    @groups = Group.with_member(current_user)
    @rooms = []
    @groups.each do |group|
      @rooms << Room.find_by(group_id: group.id)
    end
    @room = Room.find(params[:id])
    @message = Message.new(room: @room)
    @room_messages = @room.message.includes(:user)
  end

  def update
    if @room.update_attributes(permitted_parameters)
      flash[:success] = "Room #{@room.name} was updated successfully"
      redirect_to room_path(@room)
    else
      redirect_to rooms_path
    end
  end

  protected
  def permitted_parameters
    params.require(:room).permit(:name)
  end
end
