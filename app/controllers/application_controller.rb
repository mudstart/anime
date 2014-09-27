class ApplicationController < ActionController::Base
  protect_from_forgery

  def is_admin?
    current_user.id == 1
  end

  private

  def check_if_confirmed
    if user_signed_in? && !is_admin?
      redirect_to page_path('get_confirmed') unless current_user.confirmed
    end
  end
end
