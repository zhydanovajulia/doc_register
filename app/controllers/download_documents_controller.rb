class DownloadDocumentsController < ApplicationController

  def create
    send_file params[:file_path]
  end

end
