class TrackerController < ApplicationController

  def index
    @user  = User.find(session[:user_id])
    @bill  = Bill.new
    @bills = @user.bills.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  def create
    @bill             = Bill.new(bill_params)
    normalize_input
    @bill.description = BillsWrapper.call(bill_name: @bill.name)
    @bill.user_id     = session[:user_id]
    if @bill.save
      flash[:notice] = "Successfully subscribed to #{@bill.name}."
      redirect_to tracker_path
    else
      flash[:alert]  = "Not a valid bill number or already subscribed."
      redirect_to tracker_path
    end
  end

  def delete
    @bill = Bill.find(params[:id])
    @bill.destroy
    flash[:notice] = "Unsubcribed from #{@bill.name}"
    redirect_to tracker_path
  end

  private

  def bill_params
    params.require(:bill).permit(:name)
  end

  def normalize_input
    @bill.name = bill_params[:name].gsub(/[\s]/, "").upcase
  end
end
