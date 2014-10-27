require 'rails_helper'

feature "Images" do
  before :each do
    @user = create_user
    @memorial = create_memorial
    create_membership(@user, @memorial)
    sign_in(@user)
    @file =  Rails.root + 'spec/fixtures/files/mountain.jpg'
  end

  scenario "User can add an image to a memorial", js: true do
    visit_memorial(@memorial)

    click_button("Photo")

    attach_file("image[image]", @file)
    fill_in "image[subtitle]", with: "Here is a photo"
    click_button("Add Image")

    expect(page).to have_content("Here is a photo")
    expect(page).to have_css("img[src*='uploads/image/image/1/card_mountain.jpg']")
  end
end