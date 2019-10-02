Rails.application.routes.draw do
  devise_for :users

  resources :documents
  resource :download_document, only: :create

  root to: "documents#index"
end
