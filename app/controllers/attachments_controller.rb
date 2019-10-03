class AttachmentsController < ApplicationController

  def show
    attachment = Attachment.find params[:id]
    send_file attachment.full_path
  end
end
