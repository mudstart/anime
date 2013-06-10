require 'spec_helper'

feature 'View the homepage' do
  scenario 'user sees relevant information' do
    visit root_path
    expect(page).to have_css '.nav-header', :text => "Anime Show"
  end

  scenario 'guest user sees newly added episodes' do
    show = create_show
    create_episode_for_show(show)

    visit root_path
    look_for_episode(show)
  end

  scenario 'logged user has new episode from subscriptions' do
    user = sign_in_as_erik

    show = create_show
    create_episode_for_show(show)
    user.subscribe_to_show(show)

    visit root_path
    look_for_episode(show)
  end

  scenario 'logged user has episode from subscriptions' do
    user = sign_in_as_erik

    show = create_show
    episode = create_episode_for_show(show)
    user.subscribe_to_show(show)
    user.user_seen_episodes.create({:episode_id => episode.id})

    visit root_path
    expect(page).to_not have_css '.show_info_item'
  end

  def create_show
    FactoryGirl.create(:anime_show)
  end

  def create_episode_for_show(show)
    FactoryGirl.create(:episode, :anime_show => show)
  end

  def look_for_episode(show)
    expect(page).to have_css '.show_info_item', :text => show.name
  end

end
