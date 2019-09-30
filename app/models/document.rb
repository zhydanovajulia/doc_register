class Document < ApplicationRecord
  belongs_to :user
  has_many :attachments, as: :attachable, dependent: :destroy

  validates_presence_of :user_id
  validates_presence_of :name
  validates_presence_of :title
  validates_presence_of :description

  def attachments= files
    files.each do |f|
      self.attachments << Attachment.new(data: f)
    end
  end
end
