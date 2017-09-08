***** Installation Of Rspec And Capybara Testing Frameworks *****

1.- in the development, test group of Gemfile we need to add the rspec, capybara and the database_cleaner gem, in this way:

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.0'
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
end

2.- Then we need to run the command in terminal rails generate rspec:install.
3.- Then we can delete the test directory in our app, because we have already the spec directory to do this.
4.- Then we need to update our rails_helper.rb file and update the file in this way:

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rails'

include Warden::Test::Helpers
Warden.test_mode!

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.before(:suite) { DatabaseCleaner.clean_with(:truncation) }
  config.before(:each) { DatabaseCleaner.strategy = :transaction }
  config.before(:each, :js => true) { DatabaseCleaner.strategy = :truncation }
  config.before(:each) { DatabaseCleaner.start }
  config.after(:each) { DatabaseCleaner.clean }
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include FactoryGirl::Syntax::Methods
end

***** Installation Of Rspec And Capybara Testing Frameworks *****

***** Installation Of Devise *****

1.- Add the gem (gem 'devise', '~> 4.3') in the gemfile directory
2.- Run the command rails generate devise:install
3.- Update the mailer in the file development.rb and put the default url option, if we don't do it we can have some issues for sending emails.
4.- Then we need to create or views with rails generate devise:views
5.- Then we need to update the mailer form for the file devise.rb (this need to be a domain that we own so we need to change this in the future).
6.- Create the user with the command rails generate devise User first_name:string last_name:string, type:string, image:string, phone:string.
7.- Then we need to run the command bundle exec rails db:migrate.

***** Installation Of Devise *****

***** Creating A AdminUser With STI *****

1.- We need to create a new model with the name of admin_user.rb and inside of this file inherits from user, this means:

class AdminUser < User
end

***** Creating A AdminUser With STI *****

***** Installation Of Factory Girl *****

1.- Add the gem gem 'factory_girl_rails', '~> 4.8' into de development test group in our gemfile.
2.- Then we need to add the line config.include FactoryGirl::Syntax::Methods to the rails_helper.rb file.
3.- Create a directory with the name of factories and inside of this one we can create files for each model that we will need.
4.- For creation of users in test mode we can access to the terminal in sandbox mode, this means: rails c --sandbox


***** Installation Of Factory Girl *****

***** Integration Of The Administrate Feature *****

1.- Installation of the gems:
gem 'administrate', '~> 0.8.1'
gem 'bourbon', '~> 4.3', '>= 4.3.4'

2.- Run the command rails generate administrate:install
3.- We need to install bourbon just adding @import "bourbon"; in the application.scss file

***** Integration Of The Administrate Feature *****
Checking all the test
rspec -f d --color --dry-run name of file
