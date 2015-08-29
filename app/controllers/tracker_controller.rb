class TrackerController < ApplicationController
  def index
    @user  = User.find(session[:user_id])
    @bill  = Bill.new
  end

  def create
    @bill             = Bill.new(bill_params)
    normalize_input
    @bill.description = BillsWrapper.call(bill_name: @bill.name)
    @bill.user_id     = session[:user_id]
    @bill.save
    redirect_to "/"
  end

  def delete
    @bill = Bill.find(params[:id])
    @bill.destroy
    redirect_to "/"
  end

  private

  def bill_params
    params.require(:bill).permit(:name)
  end

  def normalize_input
    @bill.name = bill_params[:name].gsub(/[\s]/, "").upcase
  end
end
