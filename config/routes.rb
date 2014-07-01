Rails.application.routes.draw do
  get 'account', to: 'users#show', as: 'account'
  get 'delete_account', to: 'users#delete', as: 'delete_account'
  resources :users, 
    controller: 'users',
    only: 'create'

  root 'welcome#index'
end
