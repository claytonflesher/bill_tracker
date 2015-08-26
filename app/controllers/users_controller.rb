class UsersController < ApplicationController
  skip_before_filter :ensure_signed_in
  before_filter      :ensure_not_signed_in

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to verify_path(user_id: @user.id)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :address)
  end
end
