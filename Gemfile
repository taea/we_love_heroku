source 'https://rubygems.org'

gem 'rails', '3.2.15'
ruby '2.0.0'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end
gem 'jquery-rails'
gem "twitter-bootstrap-rails", '2.1.0'
gem 'rails_autolink'
gem 'kaminari'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-github'
gem 'fb_graph'
gem 'thin'
gem 'twitter'
gem 'devise'
gem 'figaro'
group :test, :development do
  gem 'sqlite3'
  gem 'brakeman'
  gem 'capybara'
  gem 'database_cleaner', '1.0.0.RC1'
  gem 'delorean'
  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'guard-annotate'
  gem 'guard-rspec', require: false
  gem 'guard-sprockets2'
  gem 'launchy'
  gem 'nokogiri', '1.5.10' # for :eq support
  gem 'poltergeist'
  gem 'rails-db-resetup'
  gem 'rb-fsevent', require: RUBY_PLATFORM.downcase =~ /darwin/ ? 'rb-fsevent' : false
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'spring-commands-rspec'
  gem 'spring', github: 'jonleighton/spring'
end

group :development do
  gem 'foreman'
end

group :production do
  gem 'pg'
  gem 'newrelic_rpm'
end
