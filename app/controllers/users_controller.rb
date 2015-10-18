class UsersController < ApplicationController
  skip_before_filter :ensure_signed_in, except: [:show, :update]
  before_filter      :ensure_not_signed_in, except: [:show, :update]

  def new
    @user = User.new
  end

  def create
    @user          = User.create(
      email: params[:email].downcase,
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    @user_profile  = UserProfile.new(address: params[:address])
    set_legislative_info
    if @user.id
      @user_profile.user_id = @user.id
      @user_profile.save!
      redirect_to verify_path(user_id: @user.id)
    else
      redirect_to signup_path
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  def update
    @user                 = User.find(session[:user_id])
    @user_profile         = UserProfile.find_by(user_id: @user.id)
    @user_profile.address = params[:address]
    set_legislative_info
    @user_profile.save!
    redirect_to profile_path
  end

  private

  def set_legislative_info
    if @user_profile.address != ""
      geo_coordinates = Geocoder.coordinates(@user_profile.address)
      @user_profile.latitude  = geo_coordinates[0]
      @user_profile.longitude = geo_coordinates[1]

      legislators     = OpenStatesWrapper.call(
        call_type: :geo_lookup, 
        url_parameters: { 
          "lat"  => @user_profile.latitude, 
          "long" => @user_profile.longitude 
        }
      )

      representative        = Legislator.new(json: legislators, chamber: :lower)
      senator               = Legislator.new(json: legislators, chamber: :upper)
      @user_profile.house_district  = representative.district
      @user_profile.senate_district = senator.district
      @user_profile.state           = representative.state
      @user_profile.representative  = representative.full_name
      @user_profile.senator         = senator.full_name
    end
  end
end
