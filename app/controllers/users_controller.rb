class UsersController < ApplicationController
  skip_before_filter :ensure_signed_in
  before_filter      :ensure_not_signed_in

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      set_rep_info
      redirect_to verify_path(user_id: @user.id)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :address)
  end

  def set_rep_info
    @user                 = User.find_by(email: @user.email)
    rep_info              = RepFetcher.new(@user)
    @user.house_district  = rep_info.representative.district
    @user.senate_district = rep_info.senator.district
    @user.save!
  end
end
