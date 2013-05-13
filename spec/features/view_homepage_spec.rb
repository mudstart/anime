require 'spec_helper'

feature 'View the homepage' do
  scenario 'user sees relevant information' do
    visit root_path
    expect(page).to have_css '.nav-header', :text => "Anime Show"
  end
end