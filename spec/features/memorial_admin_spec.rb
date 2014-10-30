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

  scenario "Admin users can delete any content", js: true do
    user1 = create_user
    user2 = create_user
    memorial = create_memorial(user_id: user1.id)
    story = create_story(user_id: user2.id, memorial_id: memorial.id)
    create_membership(user1, memorial)
    create_membership(user2, memorial)
    create_admin(user1, memorial)
    sign_in(user1)
    visit_memorial(memorial)

    expect(page).to have_content(story.story)
    expect(page).to have_content(user2.name)
    expect(page).to_not have_content(user1.name)

    expect(page).to have_link("Delete")

    click_link("Delete")

    expect(page).to_not have_content(story.story)
    expect(page).to_not have_content(story.story)
  end

  scenario "Admin user can ban other users and there content will disappear", js: true do
    user1 = create_user
    user2 = create_user
    memorial = create_memorial(user_id: user1.id)
    story = create_story(user_id: user2.id, memorial_id: memorial.id)
    create_membership(user1, memorial)
    create_membership(user2, memorial)
    create_admin(user1, memorial)
    sign_in(user1)
    visit_memorial(memorial)

    expect(page).to have_link("Ban User")
    expect(page).to have_content(story.story)
    expect(page).to have_content(user2.name)

    click_link("Ban User")

    expect(page).to_not have_content(story.story)
    expect(page).to_not have_content(user2.name)

  end

end

