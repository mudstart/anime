module SignInHelpers

  def sign_in
    sign_in_as 'erik@erikkat.com', 'password'
  end

  def sign_in_as(email, password)
    User.create(:email => 'erik@erikkat.com', :password => 'password')

    visit root_path
    fill_in 'Email', :with => email
    fill_in 'Password', :with => password
    click_button 'Sign in'
  end
end

Rspec.configure do |config|
  config.include SignInHelpers
end
