class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    Current.user = User.find_by(id: session[:user_id])
    @current_datetime = DateTime.now
  end

  def redirect_if_not_loggedin
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    else
      flash[:error] = 'Please sign in first'
      redirect_to '/signin'
    end
  end
  
end
