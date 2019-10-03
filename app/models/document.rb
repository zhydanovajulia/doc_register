class Document < ApplicationRecord
  belongs_to :user, inverse_of: :documents
  has_many :attachments, as: :attachable, dependent: :destroy
  attr_accessor :remove_files

  validates_presence_of :user
  validates_presence_of :name
  validates_presence_of :title
  validates_presence_of :description

  def attachments= files
    Array.wrap(files).each do |f|
      attachments << Attachment.new(data: f)
    end
  end

  def remove_files= file_ids
    ids = file_ids.reject(&:empty?)
    self.attachments.where(id: ids).delete_all if ids.any?
  end

  def remove_files
  end
end
