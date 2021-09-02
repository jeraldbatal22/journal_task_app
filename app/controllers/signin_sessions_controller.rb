class SigninSessionsController < ApplicationController
  def new
    if session[:user_id] 
      flash[:error] = 'You are already logged in, please logout first to login new credential!!!'
      redirect_to root_path
    else 
      render :new
    end
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to dashboard_path, notice: "Successfully login as #{@user.firstname.capitalize} #{@user.lastname.capitalize}"
    else 
      flash[:alert] = 'Invalid username or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Successfully logout'
  end
  
end
