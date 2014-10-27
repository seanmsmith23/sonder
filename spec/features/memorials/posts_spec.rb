require 'rails_helper'

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