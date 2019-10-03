require 'rails_helper'

feature "User signs up" do

  scenario "with valid email and password" do
    sign_up_user "qwe@qwe.qwe", "epyfnm"
    expect(page).to have_current_path(root_path)
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "with not valid email" do
    sign_up_user "qwe.qwe", "epyfnm"
    expect(page).to_not have_content("Welcome! You have signed up successfully.")
  end

  scenario "with not valid password" do
    sign_up_user "qew@qwe.qwe", "epy"
    expect(page).to have_content("Password is too short")
  end

end
