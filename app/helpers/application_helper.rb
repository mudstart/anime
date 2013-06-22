module ApplicationHelper
  def guest_or_current_user
    if user_signed_in?
      current_user
    else
      User.new
    end
  end

  def anime_show_subscriptions
    if user_signed_in?
      current_user.shows_subscribed_to
    else
      AnimeShow.limit(5)
    end
  end

  def new_indicator(show)
    unless guest_or_current_user.has_seen_all_episodes?(show)
      raw '<span class="label label-info">NEW</span>'
    end
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
