Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'tasks', to: 'tasks#index'
  get 'tasks/:id', to: 'tasks#show', as: 'task'
  # Add
  get 'new', to: 'tasks#new', as: 'new'
  post 'tasks', to: 'tasks#create'
  # Edit
  get 'tasks/:id/edit', to: 'tasks#edit', as: 'taskedit'
  patch 'tasks/:id', to: 'tasks#update'
  # Destroy
  delete 'tasks/:id', to: 'tasks#destroy'
end
