class InvestorsController < ApplicationController

  before_action :set_investor, only: [:edit, :show, :update]
  before_action  :require_user, except: [:show,:index,:new,:create]
  #before_action :require_same_investor, only: [:edit, :update]
  # before_action :require_admin, only: [:destroy]

  def index
    @investors = Investor.all.page(params[:page])
  end

  def new
    if !logged_in_user?
      flash[:danger] = "You need to make an account to our site first..please sign up or log in to your account"
      redirect_to investors_path
    else
        @investor = Investor.new
    end
  end

  def create 
    @investor = Investor.new(investor_params)
    @investor.user = current_user
    # flash[:notice] = params[:investor]
    if @investor.save
      flash[:success] = "Successfully signed up!"
      redirect_to investor_path(@investor)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @investor = Investor.find(params[:id])
    if @investor.update(investor_params)
      flash[:success] = "Successfully updated investor!"
      redirect_to investors_path
    else
      render 'edit'
    end
  end

  def show

  end

  def destroy
    @investor = Investor.find(params[:id])
    if @investor.destroy
      flash[:danger] = "Investor deleted"
      redirect_to investors_path
    else
      flash[:danger] = "Sry, your requested action couldn't be performed!"
      redirect_to investors_path
    end
  end

  private

  def set_investor
    @investor = Investor.find(params[:id])
  end

  def investor_params
		params.require(:investor).permit(:experience, category_ids: [])
  end

  def require_same_investor
    if current_investor != @investor #&& !current_investor.admin?
      flash[:warning] = "You aren't authorized to perform this action"
      redirect_to investors_path
    end
  end

  def require_admin
    if logged_in_investor? #and !current_investor.admin?
      flash[:warning] = "You aren't admin investor"
      redirect_to pages_home_path
    end
  end

end
