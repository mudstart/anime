module SignInHelpers

  def sign_in_as_erik
    sign_in_as 'erik@erikkat.com', 'password'
  end

  def sign_in_as(email, password)
    user = create_user(email, password)

    visit root_path
    click_link "Sign In"

    fill_in 'Email', :with => email
    fill_in 'Password', :with => password
    click_button 'Sign in'

    user
  end

  def create_user(email, password)
    User.create(:email => email, :password => password)
  end
end

Rspec.configure do |config|
  config.include SignInHelpers
end
