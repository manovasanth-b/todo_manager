Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Home Page route
  root to: "home#index"

  #Todo Page routes
  get "todos", to: "todos#index"
  # get "todo/:id", to: "todos#get_todo_by_id"
  post "todo/new", to: "todos#add_todo"
  put "todo/update/:id", to: "todos#mark_as_completed"
  delete "todo/delete/:id", to: "todos#delete_by_id"

  #User Page routes
  get "users", to: "users#index"
  #sign up routes
  get "users/new", to: "users#signup_page"
  post "users/new", to: "users#add_user"

  #signin routes
  get "sessions/login", to: "sessions#new", as: :new_signin
  post "sessions/login", to: "sessions#create", as: :signin

  #signout
  delete "sessions/logout", to: "sessions#delete", as: :signout
  post "users/update/:id", to: "users#update_user"

  #resources :users
  # Defines the root path route ("/")
  # root "articles#index"s
end
