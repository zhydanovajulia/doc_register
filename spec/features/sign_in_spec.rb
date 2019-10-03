require 'rails_helper'

feature "User signs in" do
  let(:user) { create :user }

  scenario "with valid email and password" do
    sign_in_user user.email, user.password
    expect(page).to have_current_path(root_path)
    expect(page).to have_content("Signed in successfully.")
  end

  scenario "with not valid password" do
    sign_in_user user.email, "123"
    expect(page).to have_content("Invalid Email or password.")
  end

  scenario "with not valid password" do
    sign_in_user "qwe@asd.asd", user.password
    expect(page).to have_content("Invalid Email or password.")
  end

end
