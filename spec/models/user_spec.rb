require 'rails_helper'

RSpec.describe User, type: :model do

  it { should have_db_column(:email) }
  it { should have_db_column(:encrypted_password) }

  it { should validate_presence_of(:email) }


  context "creates document" do
    let(:user) { create :user }

    it "without attachments" do
      doc = user.documents.create name: "New doc", title: "Important!", description: "Description"

      expect(user.reload.documents).to eq([doc])
      expect(Document.all.count).to eq(1)
      expect(doc.user).to eq(user)
    end

    it "with attachments" do
      file_pdf = Rails.root.join("spec/support/story.pdf").to_s
      file = File.open(file_pdf)

      doc = create :document
      doc.attachments = file

      expect(doc.reload.attachments.count).to eq(1)
      expect(doc.attachments.last.file_name).to eq("story.pdf")
    end

  end
end
