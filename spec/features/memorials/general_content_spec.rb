require 'rails_helper'

feature "Content" do
  let(:user){create_user}
  let(:memorial){create_memorial}

  before do
    create_membership(user, memorial)
    sign_in(user)
    visit_memorial(memorial)
  end

  scenario "User should be able to delete posts they created", js: true do
    user2 = create_user
    story1 = create_story(user_id: user2.id, memorial_id: memorial.id)

    visit_memorial(memorial)

    within('.card') do
      expect(page).to have_content(story1.story)
      expect(page).to_not have_link("Delete")
    end

    Story.find(story1.id).destroy
    story2 = create_story(user_id: user.id, memorial_id: memorial.id, story: "Another story")
    visit_memorial(memorial)

    within('.card') do
      expect(page).to have_content(story2.story)
      expect(page).to have_link("Delete")
    end

    click_link("Delete")

    expect(page).to_not have_content(story2.story)
  end

  scenario "User should be able to delete posts they created", js: true do
    user2 = create_user
    post1 = create_post(user_id: user2.id, memorial_id: memorial.id)

    visit_memorial(memorial)

    within('.card') do
      expect(page).to have_content(post1.title)
      expect(page).to_not have_link("Delete")
    end

    Post.find(post1.id).destroy
    post2 = create_post(user_id: user.id, memorial_id: memorial.id, title: "Another post")
    visit_memorial(memorial)

    within('.card') do
      expect(page).to have_content(post2.title)
      expect(page).to have_link("Delete")
    end

    click_link("Delete")

    expect(page).to_not have_content(post2.title)
  end

  scenario "User should be able to edit stories they created", js: true do
    user2 = create_user
    story1 = create_story(user_id: user2.id, memorial_id: memorial.id)

    visit_memorial(memorial)

    within('.card') do
      expect(page).to have_content(story1.story)
      expect(page).to_not have_link("Edit")
    end

    Story.find(story1.id).destroy
    story2 = create_story(user_id: user.id, memorial_id: memorial.id, story: "Another story")
    visit_memorial(memorial)

    within('.card') do
      expect(page).to have_content(story2.story)
      expect(page).to have_link("Edit")
    end

    click_link("Edit")

    expect(page).to have_content "Edit Your Story"

    fill_in "story[story]", with: "Some new content"

    click_button "Edit Story"

    expect(page).to have_content(memorial.name)
    expect(page).to have_content("Some new content")
  end
end





