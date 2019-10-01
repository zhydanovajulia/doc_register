Rails.application.routes.draw do
  devise_for :users

  resources :documents
  root to: "documents#index"
end
