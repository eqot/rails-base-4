source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.6'
# Use mysql as the database for Active Record
gem 'mysql2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Use Slim
gem 'slim-rails'

# Use Raked model
gem 'ranked-model'

# Use kaminari
gem 'kaminari'
gem 'kaminari-bootstrap'

# Use guard
group :development do
  gem 'guard'
  gem 'guard-livereload', require: false
  gem 'rack-livereload'
end

# Use Bootstrap
gem 'therubyracer'
gem 'less-rails'
gem 'twitter-bootstrap-rails'

# Use OmniAuth
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'omniauth-github'
gem 'omniauth-twitter'

# Use Downr instead of Redcarpet
gem 'downr'

# Use Nokogiri
gem 'nokogiri'

# Use Grape
gem 'grape'

# Use CarrierWave to upload file
gem 'carrierwave'

group :development, :test do
  # Use Pry
  gem 'pry-rails'
  gem 'pry-byebug'

  # User Hirb
  gem 'hirb'
  gem 'hirb-unicode'

  # Use better_errors and binding_of_caller
  gem 'better_errors'
  gem 'binding_of_caller'
end

# Use RSpec and related gems for testing
group :development, :test do
  gem 'rspec-rails'
  gem 'rspec-collection_matchers'
  gem 'factory_girl_rails'

  gem 'guard-rspec'
  gem 'spring-commands-rspec'
  gem 'rb-fsevent' if `uname` =~ /Darwin/
  gem 'terminal-notifier-guard' if `uname` =~ /Darwin/
end

group :test do
  gem 'faker'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
end
