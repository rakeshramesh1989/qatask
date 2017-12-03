require 'capybara/rspec'
require 'capybara/poltergeist'
require 'parseconfig'
Dir["support/**/*.rb"].each {|f| require_relative f}

RSpec.configure do |config|
  config.before(:each) do
    puts "Running #{example.full_description}..."
  end
end
