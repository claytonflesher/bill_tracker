require "securerandom"

class PasswordResetsController < ApplicationController
  skip_before_filter :ensure_signed_in
  before_filter      :ensure_not_signed_in

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      @user.password_reset_token = SecureRandom.hex(20)
      @user.save!
      UserMailer.reset_password(@user).deliver_now
      flash[:notice] = "An email has been sent to your inbox."
      redirect_to signin_path
    else
      flash.now[:alert] = "Email address not found."
      render :new
    end
  end

  def edit
  end

  def update
    if params[:password] == params[:password_confirmation]
      @user                       = User.find_by(password_reset_token: params[:token])
      @user.password              = params[:password]
      @user.save!
      flash[:notice] = "Password reset. Please sign in."
      redirect_to signin_path
    else
      flash.now[:alert] = "Password and Confirm do not match."
    end
  end
end
