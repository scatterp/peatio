source 'https://rubygems.org'
ruby '2.5.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Framework
gem 'rails', '~> 4.2'
gem 'rails-i18n', '>= 4.0.9'
gem 'responders', '~> 2.0'
gem 'rails-observers'

# Frontend
gem 'datagrid', '>= 1.5.7'
gem 'kaminari', '>= 0.15.1'
gem 'http_accept_language'
gem 'simple_form', '~> 3.1.1'
gem 'slim-rails', '>= 3.1.3'
gem 'sass-rails', '>= 5.0.6'
gem 'coffee-rails', '>= 4.2.2'
gem 'uglifier', '>= 2.7.2'
gem "jquery-rails", ">= 3.1.4"
gem "angularjs-rails"
gem 'bootstrap-sass', '~> 3.2.0.2'
gem 'bootstrap-wysihtml5-rails', '>= 0.3.1.24'
gem 'font-awesome-sass'
gem 'bourbon'
gem 'momentjs-rails', '>= 2.17.1'
gem 'rack-attack', '~> 4.3.1'
gem 'gon', '~> 5.2.0'

# Data
gem 'pg', '~> 0.20.0'
gem 'redis-rails', '>= 5.0.2'
gem 'rotp'
gem 'json'
gem 'jbuilder'
gem 'aasm', '~> 3.4.0'
gem 'acts-as-taggable-on', '>= 3.0.1'
gem 'enumerize'
gem 'paranoid2'
gem 'paper_trail', '~> 3.0.1'
gem 'marginalia'        # show where queries are coming from in the logs


# Background Processing
gem 'daemons-rails'
gem 'amqp', '~> 1.3.0'
gem 'bunny', '~> 1.2.1'
gem 'pusher'
gem 'eventmachine', '~> 1.0.4'
gem 'em-websocket', '~> 0.5.1'

# Authentication
gem 'doorkeeper'
gem 'omniauth'
gem 'omniauth-identity'
gem 'omniauth-weibo-oauth2'

# Authorization
gem 'cancancan'

# API
gem 'grape', '~> 0.7.0'
gem 'grape-entity', '~> 0.4.2'
gem 'grape-swagger', '~> 0.7.2'
gem 'rest-client', '~> 1.6.8'

# Misc
gem 'bcrypt-ruby', '~> 3.1.2'
gem 'figaro', '>= 0.7.0'
gem 'hashie'
gem 'active_hash', '~> 1.5.0'

gem "globalize", "~> 4.0.0"
gem 'country_select', '~> 2.1.0'


gem 'eco'
gem 'browser', '~> 0.8.0'
gem 'rbtree'
gem 'liability-proof', '0.0.9'
gem 'whenever', '~> 0.9.2'
gem 'easy_table', '>= 0.0.6'
gem 'phonelib', '~> 0.3.5'
gem 'twilio-ruby', '~> 3.11'
gem 'unread', github: 'peatio/unread'
gem 'carrierwave', '~> 0.10.0'
gem 'simple_captcha2', require: 'simple_captcha'
gem 'bundleup', require: false
gem 'colorize'
gem 'awesome_print'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker', '~> 1.4.3'
  gem 'mina'
  gem 'mina-slack', github: 'peatio/mina-slack'
  gem 'meta_request', '>= 0.4.3'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-rails'
  gem 'quiet_assets', '>= 1.1.0'
  gem 'mails_viewer', '>= 0.1.2'
  gem 'timecop'
  gem 'dotenv-rails'
  gem 'rspec-rails', '>= 3.7.1'
  gem 'byebug'
  gem 'annotate'
end

group :test do
  gem 'database_cleaner'
  gem 'mocha', :require => false
  gem 'shoulda-matchers'
  gem 'capybara', '>= 2.15.4'
  gem 'launchy'
  gem 'selenium-webdriver', '>= 2.39.0'
  gem 'poltergeist', '>= 1.16.0'
end
