require 'rails_helper'

feature "User creates document" do
  let(:user) { create :user }
  let(:file_docx) { Rails.root.join("spec/support/story.docx").to_s }
  let(:file_pdf) { Rails.root.join("spec/support/story.pdf").to_s }
  let(:file_py) { Rails.root.join("spec/support/57.py").to_s }

  before :each do
    sign_in_user user.email, user.password
  end

  scenario "and starts from the new document page" do

    click_link "New Document"
    expect(page).to have_current_path(new_document_path)

  end

  scenario "with valid fields and files" do
    create_new_document "Document 1", "Title", "description of doc 1", [file_docx, file_pdf]
    document = Document.last
    expect(page).to have_current_path(document_path(document.id))
    expect(page).to have_content("Document 1")
    expect(page).to have_content("Title")
    expect(page).to have_content("description of doc 1")
    expect(page).to have_content("story.docx")
    expect(page).to have_content("story.pdf")
    visit documents_path
    expect(page).to have_content("Document 1")
  end

  scenario "with not valid fields" do
    create_new_document "", "", ""
    expect(page).to have_current_path(documents_path)
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Description can't be blank")
  end

  scenario "with not valid file format" do
    create_new_document "Document 1", "Title", "description", file_py
    expect(page).to have_current_path(documents_path)
    expect(page).to have_content("Attachments is invalid")
  end
end
