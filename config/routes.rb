Rails.application.routes.draw do
  root 'welcome#index'

  resources :notebooks
  resources :notes
end
