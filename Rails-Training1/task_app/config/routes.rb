Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end

  # get 'tasks/index'
  # get 'tasks/show'
  # get 'tasks/new'
  # get 'tasks/edit'
  root to: 'tasks#index'
  resources :tasks
end
