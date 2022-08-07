Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "todos", to: "todos#index"
  get "todos/:id", to: "todos#get_todo_by_id"
  get "todos/new/:todo_text/:due_date", to: "todos#add_todo"
  get "todos/update/:id", to: "todos#mark_as_completed"
  # Defines the root path route ("/")
  # root "articles#index"
end
