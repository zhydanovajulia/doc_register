require 'rails_helper'

feature "User changes document" do
  let(:document) { create :document_with_pdf_attachment }
  let(:file_docx) { Rails.root.join("spec/support/story.docx").to_s }

  scenario "with new fields and file" do
    sign_in_user document.user.email, document.user.password

    visit document_path(document)
    expect(page).to have_content("story.pdf")
    expect(page).to have_content("The standard Lorem Ipsum passage, used since the 1500s")

    click_link "Edit"

    fill_in "Name", with: "changed doc"
    fill_in "Title", with: "new title"
    fill_in "Description", with: "new description"
    attach_file "document_attachments", file_docx
    click_button "Save"

    expect(page).to have_current_path(document_path(document))
    expect(page).to have_content("changed doc")
    expect(page).to have_content("new title")
    expect(page).to have_content("new description")
    expect(page).to have_content("story.docx")
    expect(page).to have_content("story.pdf")

  end

end
