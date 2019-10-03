class DocumentsController < ApplicationController

  before_action :find_document, only: [:edit, :show, :update, :destroy]

  def create
    @document = current_user.documents.new permit_params
    if @document.save
      redirect_to @document
    else
      render :new
    end
  end

  def update
    if @document.update permit_params
      redirect_to @document
    else
      render :edit
    end
  end

  def new
    @document = Document.new
  end

  def index
    @documents = current_user.documents
  end


  def show
  end

  def edit
  end

  def destroy
    @document.destroy
    redirect_to documents_url
  end

  private

  def permit_params
    params.require(:document).permit(:name, :title, :description, remove_files: [], attachments: [])
  end

  def find_document
    @document = Document.find params[:id]
  end
end
