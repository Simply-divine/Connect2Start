class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :show, :update, :destroy]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
          flash[:success] = "Object successfully created"
          redirect_to articles_path
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
      @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)

    end

    def destroy
      @user.destroy
      flash[:notice] = "User successfully deleted"
      redirect_to users_path
    end

    private
    def set_user
      @user = User.find(params[:id])
    end
    def user_params
      params.require(:user).permit(:fname, :lname, :email, :dob, :phone, :password)
    end
    
end
