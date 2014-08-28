def register_user(name="hotfeet@hotmail.com")
  visit '/registration/new'

  fill_in "user[first_name]", with: "Rex"
  fill_in "user[last_name]", with: "Ryan"
  fill_in "user[email]", with: name
  fill_in "user[password]", with: "1234"
  fill_in "user[password_confirm]", with: "1234"
  click_button "Sign Up"
end

def signin_user(name="hotfeet@hotmail.com")
  visit '/sessions/new'

  fill_in "user[email]", with: name
  fill_in "user[password]", with: "1234"
  click_button "Sign In"
end

def register_and_signin(name="hotfeet@hotmail.com")
  register_user(name)
  signin_user(name)
end

def create_memorial(name="Abe Lincoln", born="12/12/1900", died="05/12/1932")
  fill_in "memorial[name]", with: name
  fill_in "memorial[born]", with: born
  fill_in "memorial[died]", with: died
  click_button("Create Memorial")
end