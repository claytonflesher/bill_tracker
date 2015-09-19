class UsersController < ApplicationController
  skip_before_filter :ensure_signed_in, except: [:show, :update]
  before_filter      :ensure_not_signed_in, except: [:show, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    set_legislative_info
    if @user.save
      redirect_to verify_path(user_id: @user.id)
    else
      redirect_to signup_path
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])
    @user.update(address: update_params[:address])
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :address)
  end

  def update_params
    params.require(:user).permit(:address)
  end

  def set_legislative_info
    if @user.address != ""
      geo_coordinates = Geocoder.coordinates(@user.address)
      @user.latitude  = geo_coordinates[0]
      @user.longitude = geo_coordinates[1]

      legislators     = OpenStatesWrapper.call(
        call_type: :geo_lookup, 
        url_parameters: { 
          "lat"  => @user.latitude, 
          "long" => @user.longitude 
        }
      )

      representative        = Legislator.new(json: legislators, chamber: :lower)
      senator               = Legislator.new(json: legislators, chamber: :upper)
      @user.house_district  = representative.district
      @user.senate_district = senator.district
      @user.state           = representative.state
      @user.representative  = representative.full_name
      @user.senator         = senator.full_name
    end
  end
end
