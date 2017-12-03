def checktablerows(logged_in=false,cart_view=false)
  within('table.table') do
    tablerows=all('tr')
    i=1
    while(i<tablerows.length) do

      #puts  tablerows[i].all('td')[0].text
      #puts  tablerows[i].all('td')[1].find('img')[:alt]
      #puts "Square thumb"+ " #{(tablerows[i].all('td')[0].text).downcase}"
      expect(tablerows[i].all('td')[1].find('img')[:alt]). to eql("Square thumb"+ " #{(tablerows[i].all('td')[0].text).downcase}")
      #assumption that alt value of the image will be Square thumb + product name
      if logged_in
        #puts (tablerows[i].all('td')[2]).has_css?('a.btn-danger')
        #puts (tablerows[i].all('td')[2]).has_css?('a.btn-success')
        button_displayed=false
        if cart_view
          button_displayed=(tablerows[i].all('td')[2]).has_css?('a.btn-danger')
        else
          button_displayed= (tablerows[i].all('td')[2]).has_css?('a.btn-danger') || (tablerows[i].all('td')[2]).has_css?('a.btn-success')
        end
        expect(button_displayed).to eql(true)
      end
      i=i+1
    end
  end
end

def loginuser(email,password='test@123')

  visit(signin_path)
  sleep 1
  @camera.takephoto('after login page')
  fill_in 'user[email]', with: email
  fill_in 'user[password]', with: password
  @camera.takephoto('after filling details')
  find('input.btn-primary').click
  sleep 1
  @camera.takephoto('aftter login')
  puts find('div.alert-success').text
  expect(page).to have_text('Signed in successfully.')



end

def signupuser(email,password='test@123')

  visit(signup_path)
  sleep 1
  @camera.takephoto('after signup page')
  fill_in 'user[email]', with: email
  fill_in 'user[password]', with: password
  fill_in 'user[password_confirmation]', with: password
  @camera.takephoto('after filling details')
  find('input.btn-primary').click
  sleep 1
  @camera.takephoto('aftter login')
  puts find('div.alert-success').text
  expect(find('div.alert-success').text).to have_text('Welcome! You have signed up successfully.')

end

def generaterandomemail

    r = Random.new
    str=Date.today.to_s()+r.rand(1...8888888).to_s
    email='rakesh'+str+'@qa9123.com'
    puts email
    email
end

def clickonallbuttons

  buttonrray=all('a.btn-success')
  i=0
  while(i<buttonrray.length) do
    first('a.btn-success').click
    sleep 2
    @camera.takephoto('after button click ')
    i=i+1

  end

end
