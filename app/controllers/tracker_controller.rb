class TrackerController < ApplicationController

  def index
    @user  = User.find(session[:user_id])
    @bill  = Bill.new
    @bills = @user.bills.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  def create
    @bill                       = Bill.new(bill_params)
    normalize_input
    existing_bill               = Bill.find_by(name: @bill.name)
    if existing_bill
      save_subscription(existing_bill)
      redirect_to tracker_path
    else
      @bill.description         = BillsWrapper.call(bill_name: @bill.name)
      if @bill.save 
        existing_bill           = Bill.find_by(name: @bill.name)
        save_subscription(existing_bill)
        redirect_to tracker_path
      else
        flash[:alert]           = "Not a valid bill number."
        redirect_to tracker_path
      end
    end
  end

  def delete
    @bill_subscription = BillSubscription.find_by(user_id: session[:user_id], bill_id: params[:id])
    @bill_subscription.destroy
    @bill = Bill.find(params[:id])
    if @bill.users == []
      @bill.destroy
    end
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

  def save_subscription(existing_bill)
    @bill_subscription          = BillSubscription.new(
      bill_id: existing_bill.id, 
      user_id: session[:user_id]
    )
    if @bill_subscription.save
      existing_bill.description = BillsWrapper.call(bill_name: existing_bill.name)
      existing_bill.save!
      flash[:notice]            = "Successfully subscribed to #{@bill.name}."
    else
      flash[:alert]             = "Already subscribed to this bill."             
    end
  end
end
