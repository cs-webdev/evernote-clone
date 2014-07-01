Rails.application.routes.draw do
  get 'account', to: 'users#show', as: 'account'
  delete 'delete_account', to: 'users#delete', as: 'delete_account'
  get 'edit_username', to: 'users#edit_username', as: 'edit_username'
  patch 'update_username', to: 'users#update_username', as: 'update_username'

  resources :users,
    controller: 'users',
    only: 'create'

  resources :notebooks
  resources :notes

  resource  :session,
    :controller => "sessions",
    :only => [:new, :create, :destroy]

  root 'welcome#index'
end
