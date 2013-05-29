module HomePageHelper

  def homepage_episodes
    if user_signed_in?
      Episode.unseen_episodes(current_user)
    else
      Episode.limit(10)
    end
  end

end
