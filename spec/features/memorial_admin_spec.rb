require 'rails_helper'
require_relative '../helper_methods'

feature "Create a Memorial" do
  scenario "User can create a memorial and see it on their homepage" do
    register_and_signin
    click_link("Create Memorial")
    create_memorial

    expect(page).to have_content("Abe Lincoln")
  end

  scenario "User must join a memorial before they can view its content", js: true do
    register_and_signin
    click_link("Create Memorial")
    create_memorial

    signout

    register_and_signin("seconduser@gmail.com")
    click_link("Find Memorial")

    expect(page).to have_content("Abe Lincoln")

    click_link("Abe Lincoln")

    expect(page).to have_content("You haven't joined this memorial yet")
    expect(page).to have_content("Abe Lincoln")
    expect(page).to have_button("Join")

    click_button("Join")

    expect(page).to have_content("Remembering Abe Lincoln")
    expect(page).to have_button("+ Story")
    click_button("+ Story")
    expect(page).to have_button("Add Story")
    expect(page).to have_content("500")
  end
end