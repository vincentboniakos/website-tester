module TestHelper
  def login_to_site(username, password)
    fill_in('name', :with => username)
    fill_in('pass', :with => password)
    click_button('Log in')
  end

  def verify_login_worked
    page.should_not have_content("Sorry, unrecognized username or password.")
  end


end
