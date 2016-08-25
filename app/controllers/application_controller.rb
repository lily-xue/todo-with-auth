class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user,:logined?

  def login_as(user)
     session[:user_id] = user.id
     @current_user = user
  end

  def logout
    session[:user_id] = nil
    @current_user = nil
  end

  def logined?
    current_user != nil
  end

  def current_user
    @current_user
  end


end
