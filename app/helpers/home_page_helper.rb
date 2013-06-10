module HomePageHelper

  def homepage_episodes
    if user_signed_in?
      current_user.unseen_anime_show_episodes
    else
      Episode.limit(10)
    end
  end

end
