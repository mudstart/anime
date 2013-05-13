class UserSeenEpisodesController  <  ApplicationController
  before_filter :authenticate_user!

  def create
    @seen = current_user.user_seen_episodes.create(:episode_id => params[:episode_id])

    respond_to do |format|
      format.html { redirect_to(:back) }
      format.js
    end
  end
end