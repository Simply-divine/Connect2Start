class MembersController < ApplicationController

  before_action :set_member, only: [:edit, :show, :update]
  #before_action :require_same_member, only: [:edit, :update]
  # before_action :require_admin, only: [:destroy]

  def index
    @members = Member.all.page(params[:page])
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      session[:member_id] = @member.id
      flash[:success] = "Successfully signed up!"
      redirect_to member_path(@member)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      flash[:success] = "Successfully updated member!"
      redirect_to members_path
    else
      render 'edit'
    end
  end

  def show

  end

  def destroy
    @member = Member.find(params[:id])
    if @member.destroy
      flash[:danger] = "Member deleted"
      redirect_to members_path
    else
      flash[:danger] = "Sry, your requested action couldn't be performed!"
      redirect_to members_path
    end
  end

  private

  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:fname, :lname, :email, :dob, :phone, :password)
  end

  def require_same_member
    if current_member != @member #&& !current_member.admin?
      flash[:warning] = "You aren't authorized to perform this action"
      redirect_to members_path
    end
  end

  def require_admin
    if logged_in_member? #and !current_member.admin?
      flash[:warning] = "You aren't admin member"
      redirect_to pages_home_path
    end
  end

end