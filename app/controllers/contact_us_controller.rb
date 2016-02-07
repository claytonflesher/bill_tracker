class ContactUsController < ApplicationController
  skip_before_filter :ensure_signed_in

  def new
  end

  def create
  end
end
