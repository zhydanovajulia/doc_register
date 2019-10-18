class Attachment < ApplicationRecord
  mount_uploader :data, AttachmentUploader

  belongs_to :attachable, polymorphic: true

  # validate :file_size

  # def attachment_upload_limit
  #   5.megabytes
  # end

  # def file_size
  #   if data.present? && data.file.size.to_f > attachment_upload_limit.to_f
  #     errors.add(:base, "You cannot upload a file greater than #{attachment_upload_limit}MB")
  #   end
  # end

  def file_name
    data.identifier
  end

  def full_path
    data.file.file
  end

end
