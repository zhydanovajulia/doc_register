module Features
  module DocumentHelpers

    def create_new_document name, title, description, file_paths=[]
      visit new_document_path
      fill_in "Name", with: name
      fill_in "Title", with: title
      fill_in "Description", with: description
      if not file_paths.empty?
        attach_file "document_attachments", file_paths
      end
      click_button "Save"
    end


  end
end
