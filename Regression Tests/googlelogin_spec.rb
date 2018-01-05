require_relative 'spec_helper.rb'
require_relative 'test_helper.rb'


describe  "check various cases in login mode", type: :feature do

  it "check google login" do

    visit('/')
    click_on('Login/Signup Gmail')
    #sleep 1
    #@camera.takephoto('after gmail click')
    #puts page.body
    fill_in 'Email', with: 'oneclass.fb.test@gmail.com'
    sleep 1
    @camera.takephoto('after entering email')
    find('input#next').click
    sleep 1
    @camera.takephoto('after next button click')
    #puts "************"
    #puts page.body
    fill_in 'Passwd',with: 'oneclasspassword123456'
    find('input#signIn').click
    #find('div.Vwe4Vb').click
    sleep 2
    @camera.takephoto('after google signin')
    #puts "***aftergooglesignin****"
    find('button#submit_approve_access').click
    sleep 2
    @camera.takephoto('after success button click')
    #puts page.body
    puts find('div.alert-success').text
    expect(page).to have_text('Successfully authenticated from Google account.')


  end

end
