Rails.application.routes.draw do
  
  # SIGNUP
  get '/signup', to: 'registrations#new'
  post '/signup', to: 'registrations#create'
 
  # USERS
  get '/profile', to:'users#edit_profile', as: 'profile_edit'
  patch '/profile', to:'users#update_profile', as: 'profile_update'
  get '/profile/changepassword', to:'users#edit_password', as: 'password_edit'
  patch '/profile/changepassword', to:'users#update_password', as: 'password_update'

  # SIGNIN
  get '/signin', to: 'signin_sessions#new'
  post '/signin', to: 'signin_sessions#create'
  delete '/', to: 'signin_sessions#destroy'

  # PASSWORD RESET
  get '/password/reset', to: 'password_resets#new'
  post '/password/reset', to: 'password_resets#create'
  get '/password/reset/edit', to: 'password_resets#edit'
  patch '/password/reset/edit', to: 'password_resets#update'
  
  # HOME
  root to: 'home#index'
  get '/dashboard', to: 'home#dashboard'
  get 'tasks/new', to:'home#new_task'
  post 'tasks/new', to:'home#create_task'
  get 'dashboard/:journal_id/tasks/:task_id/:complete', to: 'home#mark_complete', as: 'dashboard_tasks_complete'
  

  # JOURNALS
  get '/journals/new', to: 'journals#new', as: 'journals_new'
  post '/journals/new', to: 'journals#create', as: 'journals_create'
  get '/journals/:id/edit', to: 'journals#edit', as: 'journals_edit'
  patch '/journals/:id/edit', to: 'journals#update', as: 'journals_update'
  delete '/journals/:id', to: 'journals#delete', as: 'journals_delete'

  # TASKS
  get '/journals/:id/tasks', to: 'tasks#index', as: 'journals_tasks'
  get '/journals/:id/tasks/new', to: 'tasks#new', as: 'journals_tasks_new'
  post '/journals/:id/tasks/new', to: 'tasks#create'
  get '/journals/:id/tasks/:task_id/edit', to: 'tasks#edit', as: 'journals_tasks_edit'
  patch '/journals/:id/tasks/:task_id/edit', to: 'tasks#update', as: 'journals_tasks_update'
  delete '/journals/:id/tasks/:task_id', to: 'tasks#delete', as: 'journals_tasks_delete'
  get '/journals/:id/tasks/:task_id/:complete', to: 'tasks#mark_complete', as: 'journals_tasks_complete'
  get '/journal/:id/tasks/:task_id', to: 'tasks#show', as: 'journals_tasks_show'

end
