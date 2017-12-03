require_relative 'spec_helper.rb'
require_relative 'test_helper.rb'


describe  "check signup works", type: :feature do

  it "signup with new account" do


    signupuser(generaterandomemail)
    @camera.takephoto('after successfull signup')

  end



end
