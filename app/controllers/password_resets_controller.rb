class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      # Send Email
      PasswordMailer.with(user: @user).reset.deliver_now
      redirect_to root_path, notice: "We have sent a link to reset your password."
    else
      flash[:error] = "Your email that you send is not exist in our database. Please try again."
      redirect_to root_path
    end
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
    flash[:error] =  "Your Token has expired. Please Try again"
    redirect_to root_path
  end

  def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(password_params)
      redirect_to '/signin', notice: "Your password was reset successfully. You can now login your credentials"
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
