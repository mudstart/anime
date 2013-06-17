class DownloadEpisodesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_if_confirmed

  def create
    @episode = Episode.find params[:episode_id]
    GetMp4.delay.get_video @episode

    respond_to do |wants|
      wants.html { redirect_to :back }
      wants.js {  }
    end
  end

  def destroy
    @episode = Episode.find params[:episode_id]
    @episode.video.destroy

    respond_to do |wants|
      wants.html { redirect_to :back  }
      wants.js {  }
    end
  end

end
