require 'spec_helper'

describe User do
  it "has a valid factory" do
    user = FactoryGirl.create(:user)
    user.should be_valid
  end

  it "lists the anime shows they are subscribed to" do
    user = FactoryGirl.create(:user)
    5.times do
      show = FactoryGirl.create(:anime_show)
      user.subscriptions.create({:anime_show_id => show.id})
    end

    user.subscriptions.count.should eq 5
  end

  it "lists all the episodes for shows user is subscribed to" do
    user = FactoryGirl.create(:user)
    2.times do
      show = FactoryGirl.create(:anime_show)
      user.subscriptions.create({:anime_show_id => show.id})
      FactoryGirl.create(:episode, :anime_show => show)
    end

    user.subscriptions.count.should eq 2

    user.anime_show_episodes.count.should eq 2
  end

  it "list the episodes the user has seen" do
    user = FactoryGirl.create(:user)

    show = FactoryGirl.create(:anime_show)
    user.subscriptions.create({:anime_show_id => show.id})

    5.times{ FactoryGirl.create(:episode, :anime_show => show) }
    user.user_seen_episodes.create({:episode_id => show.episodes.first.id})

    user.subscriptions.count.should eq 1
    show.episodes.count.should eq 5

    user.seen_episodes.count.should eq 1
  end

  it "lists all unseen episodes" do
    user = FactoryGirl.create(:user)

    show = FactoryGirl.create(:anime_show)
    user.subscriptions.create({:anime_show_id => show.id})

    5.times{ FactoryGirl.create(:episode, :anime_show => show) }
    user.user_seen_episodes.create({:episode_id => show.episodes.first.id})

    user.subscriptions.count.should eq 1
    show.episodes.count.should eq 5

    puts user.unseen_anime_show_episodes.to_sql
    user.unseen_anime_show_episodes.count.should eq 4
  end

end
