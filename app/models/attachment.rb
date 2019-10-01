class Attachment < ApplicationRecord
  mount_uploader :data, AttachmentUploader

  belongs_to :attachable, polymorphic: true

  def file_name
    data.identifier
  end

end
