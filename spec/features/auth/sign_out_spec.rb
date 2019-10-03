require 'rails_helper'

feature "User signs out" do
  let(:user) { create :user }

  scenario "successfully" do
    sign_in_user user.email, user.password
    click_link "Sign out"
    expect(page).to have_current_path(new_user_session_path)
    expect(page).to have_content("Log in")
  end

end
