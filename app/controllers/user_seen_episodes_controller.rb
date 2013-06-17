class UserSeenEpisodesController  <  ApplicationController
  before_filter :authenticate_user!
  before_filter :check_if_confirmed

  def create
    @seen = current_user.mark_seen(params[:episode_id])

    respond_to do |format|
      format.html { redirect_to(:back) }
      format.js
    end
  end
end