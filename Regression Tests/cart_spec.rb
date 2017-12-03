require_relative 'spec_helper.rb'
require_relative 'test_helper.rb'


describe  "check various cases related to cart", type: :feature do

  it "add item to cart " do

    email=generaterandomemail
    signupuser(email)
    @camera.takephoto('after successfull signup')
    visit(juice_path)
    @camera.takephoto('after juice page')
    itemname=first('td').text
    puts itemname
    first('a.btn-success').click  #clicking on first item for adding to cart
    sleep 3
    @camera.takephoto('after clicking on iterm')
    visit(mycart_path)
    @camera.takephoto('my cart')
    expect(itemname). to eql(first('td').text) #making sure item added to card and displayed on cart page are same
  end

  it "remove item from cart " do

    email=generaterandomemail
    signupuser(email)
    @camera.takephoto('after successfull signup')
    visit(juice_path)
    @camera.takephoto('after juice page')
    itemname=first('td').text
    puts itemname
    first('a',:text=>'Add to Cart').click  #clicking on first item for adding to cart
    @camera.takephoto('after clicking on iterm')
    visit(mycart_path)
    @camera.takephoto('my cart')
    expect(itemname). to eql(first('td').text) #making sure item added to card and displayed on cart page are same
    find('a.btn-danger').click #removing the item from cart
    visit(mycart_path)
    @camera.takephoto('my cart')
    expect(page). to have_no_text(first('td').text) #making sure item removed from cart is not displayed
  end


  it "make a order and check if it is displayed on home page " do

    email=generaterandomemail
    signupuser(email)
    @camera.takephoto('after successfull signup')
    visit(juice_path)
    @camera.takephoto('after juice page')
    itemname=first('td').text
    puts itemname
    addeditem_id=first('a',:text=>'Add to Cart')[:href].partition("?id=").last
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

  it "make a order and check if the cart is cleard " do

    email=generaterandomemail
    signupuser(email)
    @camera.takephoto('after successfull signup')
    visit(juice_path)
    @camera.takephoto('after juice page')
    itemname=first('td').text
    puts itemname
    addeditem_id=first('a',:text=>'Add to Cart')[:href].partition("?id=").last
    first('a',:text=>'Add to Cart').click  #clicking on first item for adding to cart
    @camera.takephoto('after clicking on iterm')
    visit(mycart_path)
    @camera.takephoto('my cart')
    expect(itemname). to eql(first('td').text) #making sure item added to card and displayed on cart page are same
    find('a.btn-success').click
    sleep 2
    @camera.takephoto('after making an order')
    visit(mycart_path)
    expect(page).to have_text('There is nothing in your carD') #to make sure cart is empty
  end

end
