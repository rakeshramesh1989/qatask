require_relative 'spec_helper.rb'
require_relative 'test_helper.rb'


describe  "check various cases in login mode", type: :feature do

  it "make a order and check if it is displayed on home page " do

    email=generaterandomemail
    signupuser(email)
    @camera.takephoto('after successfull signup')
    visit(juice_path)
    @camera.takephoto('after juice page')
    itemname=first('td').text
    puts itemname
    addeditem_id=first('a',:text=>'Add to Cart')[:href].partition("?id=").last
    puts "item id is #{addeditem_id}"
    first('a',:text=>'Add to Cart').click  #clicking on first item for adding to cart
    @camera.takephoto('after clicking on iterm')
    visit(mycart_path)
    @camera.takephoto('my cart')
    expect(itemname). to eql(first('td').text) #making sure item added to card and displayed on cart page are same
    find('a.btn-success').click
    sleep 2
    @camera.takephoto('after making an order')
    visit('/')
    expect(all('td')[0].text).to eql(addeditem_id)
  end


end
