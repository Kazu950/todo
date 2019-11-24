Rails.application.routes.draw do
  resources :todo_lists
  root to: 'todo_lists#index'
  post 'todo_lists/new' => 'todo_lists#create'
end
