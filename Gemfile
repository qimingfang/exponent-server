source 'https://rubygems.org'


gem 'rails', '4.2.5'

group :development do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end

group :production do
  gem 'pg', '~> 0.15'
end
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

# Heroku
gem 'unicorn'
gem 'rails_12factor', group: :production

# Exponent's push notification API
gem 'exponent-server-sdk', '~> 0.0.2'


group :development, :test do
  gem 'byebug'
end

group :development do
  gem 'web-console', '~> 2.0'
end

ruby "2.3.1"
