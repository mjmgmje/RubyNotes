Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  get '', to: 'sessions#create'
  delete 'user/:id', to: 'users#destroy', :as => :user
  get 'user/index', to: 'users#index'
  get 'user/newAdmin', to: 'users#newAdmin'
  post 'user/newAdmin', to: 'users#createAdmin'
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
  put 'notes', to: 'notes#update'
  delete 'notes', to: 'notes#delete'
  get 'user/:id', to: 'users#updateView'
  put 'user/:id', to: 'users#update'

 

end
