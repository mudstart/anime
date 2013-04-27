class GetMp4
  require 'nokogiri'
  require 'open-uri'
  require 'uri'

  def self.get_video(episode)
    doc = Nokogiri::HTML(open(episode.url))

    item = doc.at_css('div#embed_code div iframe')
    video_url = item.attr('src')

    video_doc = Nokogiri::HTML(open(video_url))

    video_doc.css('script[type="text/javascript"]').each do |item|
      item.content.match(/'file': '(.*?)',/)
      match = $1
      @matched = match if match
    end

    begin
      video_name = @matched.split('/').last
    rescue Exception => e
      return false
    end

    episode.video_remote_url @matched
    episode.save
    # %x!/usr/bin/env curl -L -o #{Rails.root}/public/videos/#{episode.name.parameterize}_#{video_name} #{@matched}!

    # episode.update_attribute(
    #   :video_file, "#{episode.name.parameterize}_#{video_name}")
  end

end
