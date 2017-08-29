source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.2'
gem 'sqlite3'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.0'
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
  gem 'factory_girl_rails', '~> 4.8'
  # Loads Environment Variables
  gem 'dotenv-rails', require: 'dotenv/rails-now'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Gems Added By Ours

# Authentication System
gem 'devise', '~> 4.3'

# Uploading Process
gem 'carrierwave', '~> 1.1'
gem 'carrierwave-aws', '~> 1.1'
gem 'mini_magick', '~> 4.7'


# JavaScripts -> Jquery
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'

# Administration Panel
gem 'administrate', '~> 0.8.1'
gem 'administrate-field-image', '~> 1.1'
gem 'bourbon', '~> 4.3', '>= 4.3.4'

# Permalinks
gem 'friendly_id', '~> 5.2', '>= 5.2.1'

# For Nice Icons
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.2'

# Paginator
gem 'will_paginate', '~> 3.1', '>= 3.1.6'

# Policies for the actions
gem 'pundit', '~> 1.1'