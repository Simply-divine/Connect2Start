class StartupsController < ApplicationController

  before_action :set_startup, only: [:edit, :show, :update]
  # before_action :require_same_startup, only: [:edit, :update]
  # before_action :require_admin, only: [:destroy]

  def index
    @startups = Startup.all.page(params[:page])
  end

  def new
    @startup = Startup.new
  end

  def create
    @startup = Startup.new(startup_params)
    if @startup.save
      session[:startup_id] = @startup.id
      flash[:success] = "Successfully signed up!"
      redirect_to startup_path(@startup)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @startup.update(startup_params)
      flash[:success] = "Successfully updated Startup!"
      redirect_to startups_path
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @startup = Startup.find(params[:id])
    if @startup.destroy
      flash[:danger] = "Startup deleted"
      redirect_to startups_path
    else
      flash[:danger] = "Sry, your requested action couldn't be performed!"
      redirect_to startups_path
    end
  end

  private

  def set_startup
    @startup = Startup.find(params[:id])
  end

  def startup_params
    params.require(:startup).permit(:org_name, :contact_name, :org_email, :password, :description, :phone, :cur_emps)
  end

  def require_same_startup
      if current_startup != @startup #&& !current_Startup.admin?
        flash[:warning] = "You aren't authorized to perform this action"
        redirect_to startups_path
      end
    end

  def require_admin
    if logged_in_startup? #and !current_Startup.admin?
      flash[:warning] = "You aren't admin Startup"
      redirect_to pages_home_path
    end
  end

end