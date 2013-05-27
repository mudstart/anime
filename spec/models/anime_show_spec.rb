require 'spec_helper'

describe AnimeShow do
  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:url) }

  it { should have_many(:episodes) }

  it "creates a minimum valid show" do
    show = AnimeShow.new({:name => "Anime Show", :url => "www.nwanime.com"})
    show.should be_valid
  end

  it "has no episodes" do
    show = AnimeShow.create({:name => "Anime Show", :url => "www.nwanime.com"})
    show.episodes.should eq []
  end

end
