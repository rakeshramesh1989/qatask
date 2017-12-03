require_relative 'spec_helper.rb'
require_relative 'test_helper.rb'


describe  "check various cases in login mode", type: :feature do

  it "check login functionality" do

    email=generaterandomemail
    signupuser(email)
    @camera.takephoto('after successfull signup')
    visit('/')
    visit(signout_path)
    sleep 1
    @camera.takephoto('after signnout')
    loginuser(email)
    expect(page).to have_text('Signed in successfully.')\

  end

  it "particular text should be displayed in loggedin mode on homepage" do

    signupuser(generaterandomemail)
    @camera.takephoto('after successfull signup')
    visit('/')
    expect(page).to have_text('Navigate to different categories and choose whatever you want')

  end

  it "name,images and button are displayed in login mode on icecream page" do
    signupuser(generaterandomemail)
    @camera.takephoto('after successfull signup')
    visit(icecream_path)
    @camera.takephoto('after icecream_path')
    checktablerows(true)
    puts page.has_css?('a.next_page')
    while(page.has_css?('a.next_page')) do # loop to visit all pages

      find('a.next_page').click
      sleep 1
      @camera.takephoto("next page")
      checktablerows
      puts page.has_css?('a.next_page')
    end

  end
  it "name,images and button are displayed in login mode on juices page" do
    signupuser(generaterandomemail)
    @camera.takephoto('after successfull signup')
    visit(juice_path)
    @camera.takephoto('after juices_path')
    checktablerows(true)
    puts page.has_css?('a.next_page')
    while(page.has_css?('a.next_page')) do # loop to visit all pages

      find('a.next_page').click
      sleep 1
      @camera.takephoto("next page")
      checktablerows
      puts page.has_css?('a.next_page')
    end

  end

  it "name,image and remove from cart button is displayed on cart page" do

    signupuser(generaterandomemail)
    @camera.takephoto('after successfull signup')
    visit(juice_path)
    @camera.takephoto('after juices_path')
    clickonallbuttons # function to add items on that  to cart
    sleep 2
    visit(mycart_path)
    checktablerows(true,true) # function to make sure name,image and remove from cart button is displayed on cart page
    @camera.takephoto('after visting cart')
  end

  it "my cart link is only displayed in logged in state and when atleast one product is in cart" do

    signupuser(generaterandomemail)
    @camera.takephoto('after successfull signup')
    expect(page.has_no_css?('a',:text=>'Cart')). to eql(true)
    visit(juice_path)
    @camera.takephoto('after juices_path')
    clickonallbuttons # function to add items on that  to cart
    sleep 4
    @camera.takephoto('after button click')
    expect(page.has_no_css?('a',:text=>'Cart')). to eql(false)


  end



end
