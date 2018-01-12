source 'https://rubygems.org'
ruby '2.5.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Framework
gem 'rails'
gem 'globalize', '~> 5.1.0.beta2'
gem 'responders'
gem 'rails-observers'

# Frontend
gem 'datagrid'
gem 'easy_table'              # Easy HTML Tables
gem 'kaminari'                # Pagination
gem 'http_accept_language'
gem 'simple_form'
gem 'slim-rails'              # Slim HTML Templating
gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'
gem "jquery-rails"
gem "angularjs-rails"
gem 'bootstrap-sass', '~> 3.2.0.2'
gem 'bootstrap-wysihtml5-rails', '>= 0.3.1.24'
gem 'font-awesome-sass'
gem 'bourbon'
gem 'momentjs-rails'
gem 'rack-attack'
gem 'gon'                     # Pass data to JS
gem 'browser'                 # Browser detection

# Data
gem 'pg', '~> 0.20.0'
gem 'redis-rails'
gem 'rotp'
gem 'oj'
gem 'jbuilder'
gem 'aasm'
gem 'acts-as-taggable-on'
gem 'enumerize'
gem 'paranoid2'
gem 'paper_trail'
gem 'marginalia'        # show where queries are coming from in the logs
gem 'seedbank'          # better seed management
gem 'jsonb_accessor'    # effective use of jsonb columns

# File handling
gem 'activestorage'
gem 'carrierwave'       # store images

# Background Processing
gem 'daemons-rails'
# gem 'amqp'
# gem 'bunny'
gem 'pusher'
# gem 'eventmachine'
# gem 'em-websocket'
gem 'sidekiq'

# Authentication
gem 'doorkeeper'
gem 'omniauth'
gem 'omniauth-identity'
gem 'omniauth-weibo-oauth2'
gem 'simple_captcha2', require: 'simple_captcha'

# Authorization
gem 'cancancan'

# API
gem 'grape'
gem 'grape-entity'
gem 'grape-swagger'
gem 'rest-client'

# SMS
gem 'phonelib'
gem 'twilio-ruby'

# Crypto
gem 'liability-proof'
gem 'bcrypt-ruby'

# Misc
gem 'unread'
gem 'figaro'                            # ENV var management

gem 'hashie'
gem 'active_hash'

gem 'country_select'

gem 'eco'
gem 'rbtree'
gem 'whenever'

gem 'bundleup', require: false
gem 'colorize'
gem 'awesome_print'
gem 'hirb'
gem 'fast_blank'
gem 'bootsnap'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'mina'
  gem 'mina-slack', github: 'peatio/mina-slack'
  gem 'meta_request', '>= 0.4.3'
  gem 'better_errors'
  gem 'binding_of_caller'
  # gem 'pry-rails'
  # gem 'quiet_assets'
  # gem 'mails_viewer'
  gem 'timecop'
  # gem 'dotenv-rails'
  gem 'rspec-rails'
  gem 'rspec-its'
  gem 'byebug'
  gem 'annotate'
  gem 'listen'
  gem 'spring'
end

group :test do
  gem 'database_cleaner'
  gem 'mocha', :require => false
  gem 'shoulda-matchers', '~> 3.1'
  gem 'rails-controller-testing'
  gem 'rspec-collection_matchers'
  gem 'capybara', '>= 2.15.4'
  gem 'launchy'
  gem 'selenium-webdriver', '>= 2.39.0'
  gem 'poltergeist', '>= 1.16.0'
end
