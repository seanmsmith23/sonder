require_relative "object_creation_methods"

def sign_in(user)
  visit '/sessions/new'

  fill_in "user[email]", with: user.email
  fill_in "user[password]", with: "1"

  click_button "Sign In"
end

def create_user_and_memorial
  user = create_user
  memorial = create_memorial
  create_membership(user, memorial)
  sign_in(user)
  visit_memorial(memorial)
end

def new_story(text)
  click_button("Story")
  fill_in "story[story]", with: text
  click_button("Add Story")
end

def story_length
  500
end

def visit_memorial(memorial)
  visit "/memorials/#{memorial.id}"
end

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