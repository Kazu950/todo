Rails.application.routes.draw do
  get 'todo_lists/index'
  get 'todo_lists/show'
  get 'todo_lists/new'
  get 'todo_lists/edit'
  get 'index/show'
  get 'index/new'
  get 'index/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
