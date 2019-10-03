Rails.application.routes.draw do
  devise_for :users

  resources :documents
  resources :attachments, only: :show

  root to: "documents#index"
end
