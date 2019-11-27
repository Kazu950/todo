Rails.application.routes.draw do
  get 'todo_lists/search', to: 'todo_lists#search'
  
  resources :todo_lists
  root to: 'todo_lists#index'
end
