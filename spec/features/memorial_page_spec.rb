require 'rails_helper'
require_relative '../helper_methods'


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

    fill_in "story[story]", with: 'a' * 3
    expect(page).to have_content(story_length - 3)

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
    create_user_and_memorial
    new_story("Here's a story")

    within (find('.card')) do
      expect(page).to_not have_content("1")
      expect(page).to_not have_css('.unlike')

      find('.story-favorite').click

      expect(page).to have_content("1")
      expect(page).to have_css('.like-count')
      expect(page).to_not have_css('.story-favorite')

      find('.unlike').click

      expect(page).to_not have_content("1")
      expect(page).to_not have_css('.like-count')
      expect(page).to_not have_css('.unlike')
      expect(page).to have_css('.story-favorite')
    end
  end

  scenario "Likes persist upon page refresh", js: true do
    create_user_and_memorial
    new_story("Here's a story")
    find('.story-favorite').click

    visit '/memorials/1'

    expect(page).to have_content("1")
    expect(page).to have_css('.like-count')
    expect(page).to_not have_css('.story-favorite')
  end
end