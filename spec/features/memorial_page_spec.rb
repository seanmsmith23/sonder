require 'rails_helper'
require_relative '../helper_methods'

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

feature "Story" do
  scenario "User can add a story", js: true do
    create_user_and_memorial

    expect(page).to have_button("Story")

    click_button("Story")
    fill_in "story[story]", with: "Good ol' Abe. So honest all of the time."
    click_button("Add Story")

    expect(page).to have_content("Good ol' Abe. So honest all of the time.")
  end

  scenario "Story counter should decrement with each character", js: true do
    create_user_and_memorial

    click_button("Story")

    fill_in "story[story]", with: 'a' * 3
    expect(page).to have_content(story_length - 3)

    fill_in "story[story]", with: 'a' * 2
    expect(page).to have_content(story_length - 2)

    fill_in "story[story]", with: 'a' * 8
    expect(page).to have_content(story_length - 8)
  end

  scenario "Story cannot be longer than #{story_length} characters, button should disable", js: true do
    create_user_and_memorial

    click_button("Story")
    fill_in "story[story]", with: 'a' * (story_length + 1)

    expect(page).to have_content("-1")
    expect(page).to have_css('.over-limit')
    within('#new_story') do
      expect(page).to have_css('input[disabled]')
    end
  end

  scenario "User can like and unlike storys", js: true do
    user = create_user(first_name: "Some", last_name: "Guy")
    memorial = create_memorial(name: "Abe Lincoln")
    create_membership(user, memorial)
    sign_in(user)
    visit_memorial(memorial)

    fill_in_story("Here's a story")

    within (find('.card')) do
      expect(page).to_not have_content("1")
      expect(page).to_not have_css('.unlike')

      find('.favorite').click

      expect(page).to have_content("1")
      expect(page).to have_css('.like-count')
      expect(page).to_not have_css('.favorite')

      find('.unlike').click

      expect(page).to_not have_content("1")
      expect(page).to_not have_css('.like-count')
      expect(page).to_not have_css('.unlike')
      expect(page).to have_css('.favorite')
    end
  end

  scenario "Likes persist upon page refresh", js: true do
    create_user_and_memorial
    fill_in_story("Here's a story")
    find('.favorite').click

    visit '/memorials/1'

    expect(page).to have_content("1")
    expect(page).to have_css('.like-count')
    expect(page).to_not have_css('.favorite')
  end
end

feature "Post" do
  let(:user){create_user}
  let(:memorial){create_memorial}

  before do
    create_membership(user, memorial)
    sign_in(user)
    visit_memorial(memorial)
  end

  scenario "User should be able to add a Post", js: true do
    expect(page).to have_button("Post")

    click_button("Post")

    expect(page).to have_content("2000")

    content = "Here is a post"

    fill_in_post({content: content})

    expect(page).to have_content(content)
  end

  scenario "Full posts can be accessed by opening modal", js: true do
    click_button("Post")

    content = 'a' * 600
    fill_in_post(content: content)

    expect(page).to_not have_content(content)
    expect(page).to have_content('a' * 100)
    expect(page).to have_content("Click for full post")

    within('.card') do
      find('.js-btn').click
    end

    expect(page).to have_content(content)
  end

  scenario "Posts track character count", js: true do
    click_button("Post")

    expect(page).to have_content(post_length)

    fill_in "post[content]", with: 'a' * 5
    expect(page).to have_content(post_length - 5)

    fill_in "post[content]", with: 'a' * 3
    expect(page).to have_content(post_length - 3)

    fill_in "post[content]", with: 'a' * 10
    expect(page).to have_content(post_length - 10)

    fill_in "post[content]", with: 'a' * (post_length + 1)
    expect(page).to have_content "-1"

    expect(page).to have_css('input[disabled]')
  end

end