require 'rails_helper'
require_relative '../helper_methods'


feature "Comment" do
  scenario "User can add a comment", js: true do
    create_user_and_memorial

    expect(page).to have_button("Add Comment")

    fill_in "comment[comment]", with: "Good ol' Abe. So honest all of the time."
    click_button("Add Comment")

    expect(page).to have_content("Good ol' Abe. So honest all of the time.")
  end

  scenario "Comment counter should decrement with each character", js: true do
    create_user_and_memorial

    fill_in "comment[comment]", with: 'a' * 3
    expect(page).to have_content(comment_length - 3)

    fill_in "comment[comment]", with: 'a' * 3
    expect(page).to have_content(comment_length - 3)

    fill_in "comment[comment]", with: 'a' * 8
    expect(page).to have_content(comment_length - 8)
  end

  scenario "Comment cannot be longer than #{comment_length} characters, button should disable", js: true do
    create_user_and_memorial

    fill_in "comment[comment]", with: 'a' * (comment_length + 1)

    expect(page).to have_content("-1")
    expect(page).to have_css('.over-limit')
    within('#new_comment') do
      expect(page).to have_css('input[disabled]')
    end
  end

  scenario "User can like and unlike comments", js: true do
    create_user_and_memorial
    new_comment("Here's a comment")

    within (find('.card')) do
      expect(page).to_not have_content("1")
      expect(page).to_not have_css('.unlike')

      find('.comment-favorite').click

      expect(page).to have_content("1")
      expect(page).to have_css('.like-count')
      expect(page).to_not have_css('.comment-favorite')

      find('.unlike').click

      expect(page).to_not have_content("1")
      expect(page).to_not have_css('.like-count')
      expect(page).to_not have_css('.unlike')
      expect(page).to have_css('.comment-favorite')
    end
  end

  scenario "Likes persist upon page refresh", js: true do
    create_user_and_memorial
    new_comment("Here's a comment")
    find('.comment-favorite').click

    visit '/memorials/1'

    expect(page).to have_content("1")
    expect(page).to have_css('.like-count')
    expect(page).to_not have_css('.comment-favorite')
  end
end