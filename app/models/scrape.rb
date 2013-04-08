class Scrape
  require 'nokogiri'
  require 'open-uri'

  def self.show(url)
    scrape_show = Scrape.new(url)
    show = scrape_show.create_show
    scrape_show.find_episodes

    show
  end

  def initialize(url)
    @url = url
  end

  def create_show
    doc = open_url
    name_show_name = nil
    # Do funky things with it using Nokogiri::XML::Node methods...

    ####
    # Search for nodes by css
    doc.css('div#category_desc h2').each do |name|
      name_show_name = name.content
    end

    if name_show_name
      @show = Show.create(:name => name_show_name, :url => @url)
    end
  end

  def find_episodes
    doc = open_url
    episode_name = nil

    ####
    # Search for nodes by css
    doc.css('div#contentwrapper #resultstats_large').each do |episode|
      found_episode = episode.css('div a')[1]
      name = found_episode.content
      url = found_episode['href']
      episode_number = name.split(' ').last

      @show.episodes.create(:name => name, :url => url, :number => episode_number)
    end

    @show.episodes
  end

  private

  def open_url
    doc = Nokogiri::HTML(open(@url))
  end

end
