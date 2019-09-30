class DocumentsController < ApplicationController

  def create
    @document = current_user.documents.new permit_params
    if @document.save
      redirect_to documents_path
    else
      render :new
    end
  end

  def new
    @document = Document.new
  end

  def index
    @documents = current_user.documents
  end

  def show
    @document = Document.find params[:id]
  end

  def destroy
    @document = Document.find params[:id]
    @document.delete
    redirect_to documents_path
  end

  private

  def permit_params
    params.require(:document).permit(:name, :title, :description, attachments: [])
  end
end
