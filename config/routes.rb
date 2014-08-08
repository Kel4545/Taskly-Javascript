Rails.application.routes.draw do
  root "task_lists#index"
  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"
  get "signout" => "sessions#destroy", as: :signout
  get "/about" => "about#about"
  get "task_lists/new" => "task_lists#new", as: :new_task_list
  post "task_lists" => "task_lists#create"
  get "task_lists/:id/edit" => "task_lists#edit", as: :edittask
  patch "task_lists/:id/edit" => "task_lists#update"
  get "task_lists/:id/new" => "tasks#new", as: :newbies
  post "/task_lists/:id/new" => "tasks#create"
  delete "task_lists/:id" => "tasks#destroy"
  get "task_lists/:id" => "task_lists#show", as: :task_list
  patch "task_lists/:id" => "tasks#update"
  get "task_lists/:id" => "task_lists#completed", as: :completed
  end



