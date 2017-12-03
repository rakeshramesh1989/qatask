require_relative 'spec_helper.rb'
require_relative 'test_helper.rb'


describe  "check navigatopm menu option on header are re-directed to correct page", type: :feature do


  it "juice" do


    visit('/')
    find("a",:text => "Juice").click
    expect(page.current_path).to eql('/juice')

  end

  it "icecream" do

    visit('/')
    click_on('Icecream')
    expect(page.current_path).to eql('/icecream')


  end

  it "all categories" do


    visit('/')
    click_on('All Categories')
    expect(page.current_path).to eql('/all_items')


  end

  it "login" do

    visit('/')
    click_on('Login')
    expect(page.current_path).to eql('/users/sign_in')

  end

  it "signup" do

    visit('/')
    click_on('Signup')
    expect(page.current_path).to eql('/users/sign_up')


  end

  it "home" do
    visit(icecream_path)
    click_on('Home')
    expect(page.current_path).to eql('/')
  end

  it "Qa Test OneClass" do
    visit(icecream_path)
    click_on('Qa Test OneClass')
    expect(page.current_path).to eql('/')
  end

end
