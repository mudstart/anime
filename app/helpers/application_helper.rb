module ApplicationHelper
  def guest_or_current_user
    if user_signed_in?
      current_user
    else
      User.new
    end
  end
end
