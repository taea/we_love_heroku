source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jquery-turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'sass-rails',   '~> 4.0.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'haml-rails'
gem 'figaro'
gem 'pg'
gem 'simple_form', '>= 3.0.0.rc'
gem 'active_decorator'
gem 'rails-i18n'
gem 'thin'
gem 'compass-rails', github: 'Compass/compass-rails', branch: 'rails4-hack'
gem 'bootstrap-sass', github: 'thomas-mcdonald/bootstrap-sass', branch: '3'
gem 'rails_autolink'
gem 'kaminari'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-github'
gem 'fb_graph'
gem 'twitter'
gem 'devise'

group :doc do
  gem 'sdoc', require: false
end

group :development do
  # Debugs
  gem 'annotate', git: 'git://github.com/ctran/annotate_models.git'
  gem 'awesome_print'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
  gem 'hirb'
  gem 'hirb-unicode'
  gem 'letter_opener'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'pry-stack_explorer'
  gem 'quiet_assets'
  gem 'rack-mini-profiler'
  gem 'tapp'
  gem 'view_source_map'
  gem 'xray-rails'
end

group :test, :development do
  # TDD
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
  gem 'spring', github: 'jonleighton/spring'
end

group :production, :staging do
  gem 'rails_12factor'
  gem 'newrelic_rpm'
end
