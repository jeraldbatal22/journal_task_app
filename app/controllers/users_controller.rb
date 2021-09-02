class UsersController < ApplicationController
  before_action :redirect_if_not_loggedin 

  def edit_profile
  end

  def update_profile
    # Current.user.update_without_password(user_params)
    if Current.user.update(user_params)
      redirect_to dashboard_path, notice: "Successfully updated user"
    else
      puts 'error'
      render :edit_profile
    end
  end

  def edit_password
  end

  def update_password
    my_password = BCrypt::Password.new(Current.user.password_digest)
    if my_password == user_params[:current_password]
      if user_params[:password] == user_params[:password_confirmation]
        if user_params[:password].length >= 8
          Current.user.update({
            password_digest: BCrypt::Password.create(user_params[:password])
          })
          redirect_to root_path, notice: "Successfully change password"
        else
          flash[:length] = "Password is too short (minimum is 8 characters)"
          render :edit_password
        end
      else
        flash[:not_match] = "New Password and Confirm New password does not match"
        render :edit_password
      end
    else
      flash[:invalid] = "Invalid current password"
      render :edit_password
    end
    
    # if Current.user.authenticate(params[:current_password])
    #   if Current.user.update(user_params)
    #   redirect_to root_path, notice: "Successfully change password"
    #   else
    #     puts 'error'
    #     render :edit_password
    #   end
    # else
    #   puts user_params
    #   puts 'error password'
    #   render :edit_password
    # end
  end

  private

  def user_params
    params.require(:user).permit(:username, :firstname, :lastname, :email, :password, :password_confirmation, :current_password)
  end
end
