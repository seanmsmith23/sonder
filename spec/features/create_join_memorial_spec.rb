require 'rails_helper'
require_relative '../helper_methods'

feature "Create a Memorial" do
  scenario "User can create a memorial and see it on their homepage" do
    register_and_signin
    click_link("Create Memorial")
    create_memorial

    expect(page).to have_content("Abe Lincoln")
  end
end