require 'rails_helper'

feature "User" do
  let(:document) { create :document_with_pdf_attachment }

  scenario "downloads attachment" do
    sign_in_user document.user.email, document.user.password
    visit document_path(document)
    click_link "story.pdf"
    expect(page.response_headers['Content-Disposition']).to include("filename=\"story.pdf\"")
  end
end
