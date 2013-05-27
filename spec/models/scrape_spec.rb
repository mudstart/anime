require 'spec_helper'

describe NarutoWireCrawler do
  it "should have 1 episode for the show" do
    show = NarutoWireCrawler.create_show("http://www.nwanime.com/1583/eureka-seven-pocket-full...")

    show.name.should == "Eureka Seven: Pocket Full of Rainbows"
    show.url.should == "http://www.nwanime.com/1583/eureka-seven-pocket-full..."
    show.episodes.count.should == 1

    show.episodes.each do |episode|
      episode.name.should == "Eureka Seven: Pocket Full of Rainbows 1"
      episode.url.should == "http://www.nwanime.com/eureka-seven-pocket-full-of-rainbows-episode-1/video/beff7d45012655b71af6/"
      episode.number.should == 1
    end
  end

  it "should have 25 episode for the show" do
    show = NarutoWireCrawler.create_show("http://www.nwanime.com/2763/sword-art-online")

    show.name.should == "Sword Art Online"
    show.url.should == "http://www.nwanime.com/2763/sword-art-online"
    show.episodes.count.should == 25

  end
end
