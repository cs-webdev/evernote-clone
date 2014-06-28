Rails.application.routes.draw do
  get 'account', to: 'users#show', as: 'account'

  root 'welcome#index'
end
