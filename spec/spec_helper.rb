ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app/vradbnb.rb')

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'database_cleaner'

Capybara.app = VRADBnB

RSpec.configure do |config|
  config.include Capybara::DSL

  config.expect_with :rspec do |expectations|

    config.before(:suite) do
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.clean_with(:truncation)
    end

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end