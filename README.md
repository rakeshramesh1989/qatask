# qatask
qa spec

Part 1 - Testing the compelete application

1)Navigate to QATest directory and start the server using the following command
 ```rails s```
 2)Run the following command to populate the DB
 `` bundle exec rake db:seed``
3)Make sure application is running at 
   ```http://localhost:3000/```
4) To test the application I have written specs using Capybara,Poltergeist webdriver and Rspec
5) Navigate it to Regression tests directory. Bundle install the gem file using the command bundle install if already not done.
   ```bundle install```
6) Requires installation of phantomjs which can be done by the following command  mentioned below
   ```brew install phantomjs```
   It can be also installed from http://phantomjs.org/download.html
7) To execute the specs navigate to the regression specs director and execute the following command
   ```screenshot_dir='dir to store screenshots' test_env="dev" bundle exec rspec .
   screenshot_dir - location to store screenshots for test steps
   test_env - environment to run the test against. dev= develop or local environment```
8)Executing the command mentioned above will display the results in the terminal


Part 2 - Test user_order_stats method

1)Navigate to QATest director and start the server using the following command
 ``rails s```
2)Run the following command to populate the DB
  ```bundle exec rake db:seed```
3)Make sure application is running at``` http://localhost:3000/```
4)Execute the following command ```ruby -I test test/models/order_test.rb```
