Rails.application.routes.draw do
  resources :labels
  root 'users#new'
  resources :sessions
  resources :tasks
  resources :users
  namespace :admin do
  	resources :users
  end
end
