class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  helper_method :current_investor, :current_startup, :logged_in_investor?, :logged_in_startup?, :current_user, :logged_in_user?, :require_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in_user?
    !!current_user
  end

  def require_user
    if !logged_in_user?
      flash[:danger] = "You are not logged in"
      redirect_to root_path
    end
  end

  def current_investor
    @current_investor ||= Investor.find(session[:investor_id]) if session[:investor_id]
  end

  def current_startup
    @current_startup ||= Startup.find(session[:startup_id]) if session[:startup_id]
  end

  def logged_in_investor?
    !!current_investor
  end

  def logged_in_startup?
    !!current_startup
  end

  def require_investor
    if !logged_in_investor?
      flash[:danger] = "You must be logged in to perform this action"
      redirect_to investors_path
    end
  end

  def require_startup
    if !logged_in_startup?
      flash[:danger] = "You must be logged in to perform this action"
      redirect_to startups_path
    end
  end

end
