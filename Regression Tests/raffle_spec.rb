require_relative 'spec_helper.rb'
require_relative 'test_helper.rb'


describe  "check various use cases in raffle", type: :feature do

  it "make sure retry message is not displayed when user tries after 10 seconds" do
    email=generaterandomemail
    signupuser(email)
    #find('a#raffle_request').click
    visit(raffle_path)
    sleep 3
    @camera.takephoto('after raffle click')
    puts page.text
    puts page.has_text?('you win!')
    visit('/')
    i=0
    while(i<5) do
      sleep 10
      visit(raffle_path)
      puts page.text
      page.should have_no_text('You can retry in')
      i=i+1
    end
    sleep 1
    @camera.takephoto('after visit home page')


  end

  it "make sure retry message is displayed when users tries within 10 seconds" do
    email=generaterandomemail
    signupuser(email)
    #find('a#raffle_request').click
    visit(raffle_path)
    puts page.text
    visit(raffle_path)
    puts page.text
    page.should have_text('You can retry in')
    @camera.takephoto('after visit home page')

  end

  it "raffle should not be accessible in logged out state" do
    visit(raffle_path)
    puts page.text
    page.should have_text 'You should be loggedin user!'
  end
end
