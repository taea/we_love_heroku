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
  gem 'rspec-rails'
  gem 'spork', '~> 0.9.0.rc'
  gem 'guard'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'rb-fsevent', :require => false
  gem 'taps'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :development do
  gem 'foreman'
end

group :production do
  gem 'pg'
  gem 'newrelic_rpm'
end
