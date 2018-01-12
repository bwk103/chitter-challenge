ENV['RACK_ENV'] ||= 'test'

require 'simplecov'
require 'simplecov-console'
require './app/app.rb'
require 'capybara/rspec'
require 'database_cleaner'

require './app/models/peep'

require_relative './helpers/users'
require_relative './helpers/peeps'


Capybara.app = ChitterApp

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.include UserHelpers
  config.include PeepHelpers
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
  end
end
