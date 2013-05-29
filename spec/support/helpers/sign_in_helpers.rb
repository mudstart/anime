module SignInHelpers

  def sign_in_as_erik
    sign_in_as 'erik@erikkat.com', 'password'
  end

  def sign_in_as(email, password)
    create_user

    visit root_path
    fill_in 'Email', :with => email
    fill_in 'Password', :with => password
    click_button 'Sign in'
  end

  def create_user
    User.create(:email => 'erik@erikkat.com', :password => 'password')
  end
end

Rspec.configure do |config|
  config.include SignInHelpers
end
