Rails.application.routes.draw do
  root 'welcome#index'

  resources :notebooks

  resource  :session,
    :controller => "sessions",
    :only => [:new, :create, :destroy]


end
