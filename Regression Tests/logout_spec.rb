require_relative 'spec_helper.rb'
require_relative 'test_helper.rb'


describe  "check various cases in logged out mode", type: :feature do

  it "check logout functionality" do

    email=generaterandomemail
    signupuser(email)
    @camera.takephoto('after successfull signup')
    visit('/')
    find("a",:text => "Logout").click
    sleep 2
    @camera.takephoto('after sign_out')
    puts page.status_code
    expect(page).to have_text('Signed out successfully.')
  end

  it "home page should have text Login/Signup first in logged out state" do

    visit('/')
    puts find('p.bg-danger').text
    expect(find('p.bg-danger').text).to eql('Login/Signup first')

  end

  it "names and images are displayed on icecream page" do

    visit('/icecream')
    checktablerows  #method to check if name and images are displayed on each row
    puts page.has_css?('a.next_page')
    while(page.has_css?('a.next_page')) do # loop to visit all pages

      find('a.next_page').click
      sleep 1
      @camera.takephoto("next page")
      checktablerows
      puts page.has_css?('a.next_page')
    end


  end

  it "names and images are displayed on juice page" do

    visit('/juices')
    checktablerows  #method to check if name and images are displayed on each row
    puts page.has_css?('a.next_page')
    while(page.has_css?('a.next_page')) do # loop to visit all pages

      find('a.next_page').click
      sleep 1
      @camera.takephoto("next page")
      checktablerows
      puts page.has_css?('a.next_page')
    end
  end

  it "add to cart button should not be displayed in logged in mode on juice page" do

    visit('/juices')
    expect(page.has_no_css?('a.btn-success')).to eql('true')
  end

  it "add to cart button should not be displayed in logged in mode on icecream page" do

    visit('/icecream')
    expect(page.has_no_css?('a.btn-success')).to eql('true')

  end

  it "my cart page is not accessible in logout mode" do
    #this is to ensure backend validation in place when user acecess url directly in loggeout state
    visit(mycart_path)
    @camera.takephoto('after mycart visit')
    expect(page.current_path).to eql('mycart_path')

  end





end
