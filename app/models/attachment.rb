class Attachment < ApplicationRecord
  mount_uploader :data, AttachmentUploader

  belongs_to :attachable, polymorphic: true

end
