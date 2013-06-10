require 'spec_helper'

feature "View application layout" do
  scenario "side nav displays show subscriptions" do
    user = sign_in_as_erik

    show_1 = FactoryGirl.create(:anime_show, :name => 'Show 1')
    user.subscribe_to_show(show_1)

    show_2 = FactoryGirl.create(:anime_show, :name => 'Show 2')
    user.subscribe_to_show(show_2)

    show_3 = FactoryGirl.create(:anime_show, :name => 'Show 3')

    visit root_path

    has_show_in_side_nav(show_1)
    has_show_in_side_nav(show_2)
    show_not_in_side_nav(show_3)
  end

  scenario "side nav displays all shows for guest" do
    show_1 = FactoryGirl.create(:anime_show, :name => 'Show 1')
    show_2 = FactoryGirl.create(:anime_show, :name => 'Show 2')
    show_3 = FactoryGirl.create(:anime_show, :name => 'Show 3')

    visit root_path

    has_show_in_side_nav(show_1)
    has_show_in_side_nav(show_2)
    has_show_in_side_nav(show_3)
  end

  scenario "side nav indicates unseen episodes" do
    user = sign_in_as_erik

    show_1 = FactoryGirl.create(:anime_show, :name => 'Show 1')
    FactoryGirl.create(:episode, :anime_show => show_1)
    user.subscribe_to_show(show_1)

    visit root_path

    expect(page).to have_content "NEW"
  end

  scenario "side nav doesnt indicate unseen episodes" do
    user = sign_in_as_erik

    show_1 = FactoryGirl.create(:anime_show, :name => 'Show 1')
    episode = FactoryGirl.create(:episode, :anime_show => show_1)
    user.subscribe_to_show(show_1)
    user.mark_seen(episode.id)

    visit root_path

    expect(page).to_not have_content "NEW"
  end

  # Helpers

  def has_show_in_side_nav(show)
    expect(page).to have_css "#side_well", :text => truncate(show.name, :length => 15)
  end

  def show_not_in_side_nav(show)
    expect(page).to_not have_css "#side_well", :text => truncate(show.name, :length => 15)
  end
end