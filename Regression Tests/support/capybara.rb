require_relative "./0_test_config"
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: false, timeout: 90 ,:phantomjs_options => ['--debug=no', '--load-images=yes' ,'--ssl-protocol=any','--ignore-ssl-errors=true'], debug: false)
end
Capybara.default_driver =  :poltergeist
Capybara.app_host = test_config['env_url']
Capybara.run_server = false
def setregular_size

  page.driver.resize(1024,768)

end
puts "test url is #{test_config['env_url']} "
RSpec.configure do |config|
  config.before(:each) do
    puts "*********before each block *****************"

  end
  config.after(:each) do

    Capybara.reset_sessions!
    puts "*********after each block *****************"
  end
end
