require 'rails_helper'

feature "Welcome" do
  scenario 'User should see a registration form and a button for signin' do
    visit '/'

    expect(page).to have_content("Sonder")
    expect(page).to have_content("A community for remembering the ones we've lost")
    expect(page).to have_content("First Name")
    expect(page).to have_content("Last Name")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
    expect(page).to have_content("Confirm Password")
    expect(page).to have_button("Sign Up")
    expect(page).to have_content("Already signed up?")
    expect(page).to have_link("Sign In")
  end

  scenario 'User should be able to register' do
    register_user

    expect(page).to have_content("Thanks for registering!")
  end

  scenario 'User should be able to signin' do
    register_and_signin

    expect(page).to have_content("Create Memorial")
    expect(page).to have_content("Find Memorial")
    # expect(page).to have_content("Your Memorials")
  end
end
