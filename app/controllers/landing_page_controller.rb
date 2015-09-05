class LandingPageController < ApplicationController
  skip_before_filter :ensure_signed_in
  before_filter :ensure_not_signed_in

  def index
  end
end
