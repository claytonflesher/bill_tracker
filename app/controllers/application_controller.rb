class ApplicationController < ActionController::Base
  before_filter :ensure_signed_in

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def ensure_signed_in
    unless current_user
      session[:return_to] = request.url
      redirect_to signin_path
    end
  end

  def ensure_not_signed_in
    if current_user
      redirect_to tracker_path
    end
  end

  def current_user
    session[:user_id] && User.find(session[:user_id])
  end
  helper_method :current_user
end
