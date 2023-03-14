Rails.application.routes.draw do
  # ログイン画面の表示
  get '/login', to: 'sessions#new'
  # ログイン画面からPOST
  post '/login', to: 'sessions#create'
  # ログアウト
  delete '/logout', to: 'sessions#destroy'
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
