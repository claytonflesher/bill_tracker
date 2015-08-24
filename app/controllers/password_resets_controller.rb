require "securerandom"

class PasswordResetsController < ApplicationController
  skip_before_filter :ensure_signed_in
  before_filter      :ensure_not_signed_in

  def new
  end

  def create
    @user = User.find_by(params[:email])
    if @user
      @user.password_reset_token = SecureRandom.hex(20)
      @user.save!
      UserMailer.reset_password(@user).deliver_now
      flash.now[:notice] = "An email has been sent to your inbox."
    else
      flash.now[:alert] = "Email address not found."
      render :new
    end
  end

  def edit
  end

  def update
    @user                       = User.find_by(params[:reset_password_token])
    @user.password              = params[:password]
    @user.password_confirmation = params[:password_confirmation]
    @user.save!
    flash[:notice] = "Password reset. Please sign in."
    redirect_to signin_path
  end
end
