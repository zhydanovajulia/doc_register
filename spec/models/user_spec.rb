require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { create :user }

  it { should have_db_column(:email) }
  it { should have_db_column(:encrypted_password) }
  it { should validate_presence_of(:email) }

  it "creates document with attachments" do
    file_pdf = Rails.root.join("spec/support/story.pdf").to_s
    file = File.open(file_pdf)

    doc = create :document
    doc.attachments = file

    expect(doc.reload.attachments.count).to eq(1)
    expect(doc.attachments.last.file_name).to eq("story.pdf")
  end

  it "removes attachment from document" do
    doc = create :document_with_pdf_attachment
    doc.remove_files = doc.attachments.first.id.to_s
    expect(doc.reload.attachments.count).to eq(0)
  end
end
