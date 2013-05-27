require 'spec_helper'

describe Episode do
  it { should belong_to(:anime_show)}
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:number)}
  it { should validate_presence_of(:url)}
  it { should validate_presence_of(:anime_show_id)}
  it { should validate_uniqueness_of(:number) }

  it "creates a valid epsiode" do
    show = AnimeShow.create({
      :name => 'Sample',
      :url => 'www.nwanime.com'
    })

    epsiode = show.episodes.build({
      :name => 'A Show',
      :number => 1,
      :url => 'www.fakeurl.com'
    })
    epsiode.should be_valid
  end

  it "can not have the same episode number" do
    show = AnimeShow.create({
      :name => 'Sample',
      :url => 'www.nwanime.com'
    })

    epsiode_1 = show.episodes.create({
      :name => 'A Show',
      :number => 1,
      :url => 'www.fakeurl.com'
    })

    epsiode_2 = show.episodes.build({
      :name => 'Another Show',
      :number => 1,
      :url => 'www.fakeurl.com'
    })
    epsiode_2.should_not be_valid
  end
end
