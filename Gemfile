source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'json'

gem 'devise'
gem "paperclip"
gem "will_paginate"
gem 'nokogiri'
gem 'high_voltage'
gem "twitter-bootstrap-rails"
gem 'exception_notification'
gem 'delayed_job_active_record'
gem 'daemons'
gem 'paperclip-aws'
gem "figaro"
gem 'dj_mon'

group :production do
  gem 'mysql2'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'sqlite3'
  gem 'factory_girl_rails', ' 1.7.0'
  gem 'faker'
  gem 'capistrano-rails',   '~> 1.1', require: false
  gem 'capistrano-bundler', '~> 1.1', require: false
end

group :test do
  gem "guard-rspec"
  gem 'rb-fsevent', '~> 0.9'
  gem 'shoulda-matchers', '2.0.0'
  gem 'database_cleaner'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano', '~> 3.0', require: false, group: :development
