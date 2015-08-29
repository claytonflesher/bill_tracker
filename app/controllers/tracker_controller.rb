class TrackerController < ApplicationController
  def index
    @user  = User.find(session[:user_id])
    @bill  = Bill.new
  end

  def create
    @bill = Bill.new(bill_params)
    @bill.user_id = session[:user_id]
    @bill.save!
    redirect_to "/"
  end

  private

  def bill_params
    params.require(:bill).permit(:name)
  end
end
