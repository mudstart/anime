require 'spec_helper'

feature 'Sign in as a user' do
  scenario 'with an email address' do
    visit root_path
    sign_in
    expect(page).to have_css '.alert', :text => 'Signed in successfully.'
  end
end
