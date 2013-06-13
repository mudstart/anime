class NarutoWireCrawler
  require 'nokogiri'
  require 'open-uri'

  def self.create_show(url)
    scrape_show = NarutoWireCrawler.new(url)
    show = scrape_show.create_show
    scrape_show.find_and_create_episodes(url)

    show
  end

  def self.update_show(show)
    scrape_show = NarutoWireCrawler.new(show)
    scrape_show.find_and_create_episodes(show.url)
  end

  def initialize(input)
    case input
    when AnimeShow
      @show_url = input.url
      @show = input
    else
      @show_url = input
    end
  end

  def create_show
    doc = Nokogiri::HTML(open(@show_url))
    name_show_name = nil

    doc.css('div#category_desc h2').each do |name|
      name_show_name = name.content
    end

    image_url = find_show_image(doc)

    if name_show_name
      @show = AnimeShow.create(:name => name_show_name,
        :description => '',:url => @show_url, :image_url => image_url)
    end
  end

  def find_and_create_episodes(show_page_url)
    doc = Nokogiri::HTML(open(show_page_url))
    episode_name = nil

    doc.css('div#contentwrapper #resultstats_large').each do |episode|
      ep_obj = create_episode(episode)

      if ep_obj.persisted?
        @show.touch
        GetMp4.delay.get_video ep_obj
      else
        return
      end
    end

    find_episodes_on_next_page(doc)

    @show.episodes
  end

  private

  def create_episode(episode)
    found_episode = episode.css('div a')[1]
    name = found_episode.content
    ep_url = found_episode['href']
    episode_number = name.split(' ').last

    @show.episodes.create(:name => name, :url => ep_url,
      :number => episode_number)
  end

  def find_episodes_on_next_page(doc)
    doc.css('div#paging a').each do |next_page|
      if next_page.content == 'Next»'
        find_and_create_episodes(next_page['href'])
      end
    end
  end

  def find_show_image(doc)
    style = doc.at_css('div.moduleEntryThumb-med')['style']
    style.match(/\((.*)\)/m)[0]
    $1
  end

end
