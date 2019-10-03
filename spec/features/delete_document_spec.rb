require 'rails_helper'

# feature "User deletes document" do
#   let(:document) { create :document, title: "Special doc" }

#   before :each do
#     sign_in_user document.user.email, document.user.password
#   end

#   scenario "after confirmation" do
#     visit document_path(document)

#     expect(page).to  have_content("Special doc")

#     accept_modal do
#       click_link 'Delete'
#     end


#     expect(page).to have_current_path(documents_path)
#     expect(page).to_not  have_content("Special doc")
#   end

# end
