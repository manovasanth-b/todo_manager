Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "todos", to: "todos#index"
  get "todos/:id", to: "todos#get_todo_by_id"
  post "todos/new", to: "todos#add_todo"
  post "todos/update/:id", to: "todos#mark_as_completed"

  get "users", to: "users#index"
  post "users/new", to: "users#add_user"
  post "users/update/:id", to: "users#update_user"
  post "users/login", to: "users#auth"
  #resources :users
  # Defines the root path route ("/")
  # root "articles#index"
end
