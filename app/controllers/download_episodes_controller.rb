class DownloadEpisodesController < ApplicationController

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
