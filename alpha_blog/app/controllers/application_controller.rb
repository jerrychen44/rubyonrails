class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  #by default, below three method can olny used by controllers
  #so if we need to let these three can be used on views, need add below helper_method

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  def logged_in?
    !!current_user
  end


  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end

end
