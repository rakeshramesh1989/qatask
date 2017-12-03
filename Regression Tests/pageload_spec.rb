require_relative 'spec_helper.rb'
require_relative 'test_helper.rb'


describe  "check various pages are loaded properly", type: :feature do


  it "juice" do

    visit('/juice')
    @camera.takephoto('after juice page loaded')
    expect(page.status_code).to eql(200)


  end

  it "icecream" do

    visit('/icecream')
    @camera.takephoto('after icecream page loaded')
    expect(page.status_code).to eql(200)
  end

  it "all categories" do

    visit('/all_items')
    @camera.takephoto('after all categories page loaded')
    expect(page.status_code).to eql(200)
  end

  it "login" do

    visit('/users/sign_in')
    @camera.takephoto('after login page loaded')
    expect(page.status_code).to eql(200)
  end

  it "signup" do

    visit('/users/sign_up')
    @camera.takephoto('after signup page loaded')
    expect(page.status_code).to eql(200)
  end

end
