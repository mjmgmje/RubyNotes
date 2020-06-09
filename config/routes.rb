Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  get '', to: 'sessions#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  get 'logout', to: 'sessions#logout'
  get 'notes', to: 'notes#index'
  get 'notes/index'
  get 'notes/show'
  get 'notes/new'
  post 'notes', to: 'notes#create'

end
