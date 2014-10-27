require 'rails_helper'

feature "Create a Memorial" do
  scenario "User can create a memorial and see it on their homepage" do
    user = create_user
    memorial = create_memorial
    create_membership(user, memorial)
    sign_in(user)
    visit_memorial(memorial)

    expect(page).to have_content(memorial.name)
  end

  scenario "User must join a memorial before they can view its content", js: true do
    user = create_user
    memorial = create_memorial
    user2 = create_user
    sign_in(user2)

    visit_memorial(memorial)

    expect(page).to have_content("You haven't joined this memorial yet")
    expect(page).to have_content(memorial.name)
    expect(page).to have_button("Join")

    click_button("Join")

    expect(page).to have_content(memorial.name)
    expect(page).to have_button("Story")
  end
end