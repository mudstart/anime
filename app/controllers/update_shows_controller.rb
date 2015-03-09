class UpdateShowsController < ApplicationController
  before_filter :check_if_confirmed

  def update
    @anime_show = AnimeShow.find(params['anime_show_id'])
    NarutoWireCrawler.delay.update_show(@anime_show)
    respond_to do |format|
      format.html { redirect_to :back, :notice => 'Show is updating' }
    end
  end

end
