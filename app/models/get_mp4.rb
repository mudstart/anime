class GetMp4
  require 'nokogiri'
  require 'open-uri'
  require 'uri'

  def self.get_video(episode_title, url)
    doc = Nokogiri::HTML(open(url))

    item = doc.at_css('div#embed_code div iframe')
    video_url = item.attr('src')

    video_doc = Nokogiri::HTML(open(video_url))

    video_doc.css('script[type="text/javascript"]').each do |item|
      item.content.match(/'file': '(.*?)',/)
      match = $1
      @matched = match if match
    end
    video_name = @matched.split('/').last

    %x!/usr/bin/env curl -L -o downloads/#{episode_title}_#{video_name} #{@matched}!
  end

end
