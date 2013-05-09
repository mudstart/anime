class Scrape
  require 'nokogiri'
  require 'open-uri'

  def self.show(url)
    scrape_show = Scrape.new(url)
    show = scrape_show.create_show
    scrape_show.find_episodes(url)

    show
  end

  def self.update_show(show)
    scrape_show = Scrape.new(show)
    scrape_show.find_episodes(show.url)
  end

  def initialize(input)
    case input
    when AnimeShow
      @url = input.url
      @show = input
    else
      @url = input
    end
  end

  def create_show
    doc = Nokogiri::HTML(open(@url))
    name_show_name = nil
    # Do funky things with it using Nokogiri::XML::Node methods...

    ####
    # Search for nodes by css
    doc.css('div#category_desc h2').each do |name|
      name_show_name = name.content
    end

    description = doc.at_css('div#category_desc').content
    style = doc.at_css('div.moduleEntryThumb-med')['style']
    style.match(/\((.*)\)/m)[0]
    image_url = $1

    if name_show_name
      @show = AnimeShow.create(:name => name_show_name,
        :description => description,:url => @url, :image_url => image_url)
    end
  end

  def find_episodes(url)
    doc = Nokogiri::HTML(open(url))
    episode_name = nil

    ####
    # Search for nodes by class
    doc.css('div#contentwrapper #resultstats_large').each do |episode|
      found_episode = episode.css('div a')[1]
      name = found_episode.content
      ep_url = found_episode['href']
      episode_number = name.split(' ').last

      episode.at_css('img.moduleEntryThumb-med')['style'].match(/\((.*)\)/m)[0]
      image_url = $1

      ep_obj = @show.episodes.create(:name => name, :url => ep_url,
        :number => episode_number)
      if ep_obj.persisted?
        @show.touch
        GetMp4.delay.get_video ep_obj
      else
        return
      end
    end

    doc.css('div#paging a').each do |next_page|
      if next_page.content == 'Next»'
        find_episodes(next_page['href'])
      end
    end

    @show.episodes
  end

end
