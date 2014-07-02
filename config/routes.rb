Rails.application.routes.draw do
  get 'account', to: 'users#show', as: 'account'
  delete 'delete_account', to: 'users#delete', as: 'delete_account'
  get 'edit_username', to: 'users#edit_username', as: 'edit_username'
  put 'update_username', to: 'users#update_username', as: 'update_username'
  
  resources :users, 
    controller: 'users',
    only: 'create'

  resources :notebooks

  root 'welcome#index'
end
