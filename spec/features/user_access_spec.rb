require 'rails_helper'

feature "User" do
  let(:user1) { create :user }
  let(:document) { create :document, name: "Private document" }

  scenario "sees only his docuemnts" do
    sign_in_user user1.email, user1.password

    expect(page).to have_current_path(root_path)
    expect(page).to_not have_content("Private document")

    click_link "Sign out"
    sign_in_user document.user.email, document.user.password
    expect(page).to have_current_path(root_path)
    expect(page).to have_content("Private document")

  end

  scenario "not logged in sees Sign in page" do
    visit root_path
    expect(page).to_not have_content("My Documents")
    expect(page).to have_content("Log in")
  end
end
