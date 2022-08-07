class TodosController < ApplicationController
  def index
    render plain: "Todos Here!! we can see -> \n#{Todo.order(:due_date).map { |todo| todo.format_todo }.join("\n")}"
  end

  def get_todo_by_id
    id = params[:id]
    render plain: "#{Todo.find(id).format_todo}"
  end

  def add_todo
    todo_text = params[:todo_text]
    due_date = params[:due_date]
    created_todo = Todo.create!(:todo_text => todo_text, :due_date => due_date.to_date, :completed => false)
    rendered_text = created_todo.id != nil ? "#{created_todo[:todo_text]} Task successfully created!!" : "Error: on creating task"
    render plain: "#{rendered_text} "
  end

  def mark_as_completed
    id = params[:id]
    todo = Todo.find(id)
    todo.completed = true
    todo.save
    rendered_text = todo.id != nil ? "#{todo[:id]} Task has been successfully updated!!" : "Error: on updating task"
    render plain: "#{rendered_text} "
  end
end
