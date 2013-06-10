require 'spec_helper'

describe AnimeShow do
  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:url) }

  it { should have_many(:episodes) }

  it { should have_many(:subscriptions)}

  it "has a valid factory" do
    show = FactoryGirl.create(:anime_show)
    show.should be_valid
  end

  it "verify there are no episodes" do
    show = FactoryGirl.create(:anime_show)
    show.episodes.should eq []
  end

  it "verify there are episodes" do
    show = FactoryGirl.create(:anime_show)
    FactoryGirl.create(:episode, :anime_show_id => show.id)
    show.episodes.count.should eq 1
  end
end
