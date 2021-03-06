source 'https://rubygems.org'
ruby '2.2.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# more icons for social media buttons
gem "font-awesome-rails"
# adds cool css and stuff
gem 'bootstrap-sass', '~> 3.3.5'
#used to upload photos/pictures/images/viewablefileintheformatofseeing
gem "paperclip", :git => "git://github.com/thoughtbot/paperclip.git"
#Amazon s3 services gem
gem 'aws-sdk', '~> 1.61.0'

gem 'devise'

#makes fake names and stuff
gem 'faker'
#makes super amounts of entries in table
gem 'populator'
#adds pagination
gem 'will_paginate', '~> 3.0.6'

#google maps, baby
gem 'gmaps4rails'
#charts for repairs
gem 'googlecharts'

gem 'geocoder'

gem 'mattetti-googlecharts'

gem "chartkick"
#gem for viewing photos
gem 'lazybox'

#gems for the mail contact us form
gem 'mail_form'

gem 'mail'

gem 'stripe'

gem 'mechanize'
#YELP!
gem 'yelp', require: 'yelp'

group :development, :production do
  #delayed jobs
  gem 'delayed_job_active_record'
  #sending mass emails
  gem 'sendgrid'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :test do
  gem 'simplecov', :require => false
  gem 'shoulda-matchers'
  gem 'factory_girl_rails', '~> 4.0'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  #used to stop execution and debug.  I like it better than byebug
  gem 'pry'

  gem 'better_errors'

  #for testing purposes
  gem 'rspec-rails', '~> 3.0'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'database_cleaner'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'dotenv-rails'

end
