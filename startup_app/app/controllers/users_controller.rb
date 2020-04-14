class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :show, :update]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
          flash[:success] = "Object successfully created"
          redirect_to users_path
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end
    
    def index
      # @users = User.all
      @users = User.all.page(params[:page])
    end
    
    def edit
    end

    def update
      if @user.update(user_params)
        flash[:success] = "Successfully updated User!"
        redirect_to users_path
      else
        render 'edit'
      end
    end

    def show
      @user = User.find(params[:id])
      if @user.destroy
        flash[:danger] = "User deleted"
        redirect_to users_path
      else
        flash[:danger] = "Sry, your requested action couldn't be performed!"
        redirect_to users_path
      end
    end

    private
    def set_user
      @user = User.find(params[:id])
    end
    def user_params
      params.require(:user).permit(:fname, :lname, :email, :dob, :phone, :password)
    end
    
end
