class RegistrationsController < ApplicationController
  def new
    @user = User.new
      if session[:user_id] 
        flash[:error] = 'You are already logged in, please logout first to register new credential!!!'
        redirect_to root_path
      else 
        render :new
      end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Successfully Created User"
      redirect_to dashboard_path
    else 
      # flash[:error] = "Something was wrong"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :firstname, :lastname, :email, :password, :password_confirmation)
  end
end
