class TodosController < ApplicationController
  # protect_from_forgery with: :null_session

  def index
    # render plain: "Todos Here!! we can see -> \n#{Todo.order(:due_date).map { |todo| todo.format_todo }.join("\n")}"
    if current_user
      @todos = Todo.all.where(:user_id => current_user.id)
      render "index"
    else
      redirect_to root_path
    end
  end

  def get_todo_by_id
    id = params[:id]
    # render plain: "#{Todo.find(id).format_todo}"
    render "index"
  end

  def add_todo
    if current_user
      todo_text = params[:todo_text]
      due_date = params[:due_date]
      created_todo = Todo.create!(:user_id => current_user.id, :todo_text => todo_text, :due_date => due_date.to_date, :completed => false)
      begin
        if created_todo != nil && created_todo.id != nil
        else raise "Error: on creating task"         end
      rescue Exception => e
        flash[:notice] = e.message
      end
      redirect_to todos_path
    else redirect_to root_path     end
  end

  def delete_by_id
    if current_user
      id = params[:id]
      todo = Todo.find_by(:id => id, :user_id => current_user.id)
      begin
        if todo != nil && todo.id != nil
          todo.destroy
        else raise "Error: on deleting task"         end
      rescue Exception => e
        flash[:notice] = e.message
      end
      redirect_to todos_path
    else redirect_to root_path     end
  end

  def mark_as_completed
    if current_user
      id = params[:id]
      todo = Todo.find_by(:id => id, :user_id => current_user.id)
      begin
        if todo != nil && todo.id != nil
          todo.completed = params[:completed]
          todo.save
        else raise "Error: on updating task"         end
      rescue Exception => e
        flash[:notice] = e.message
      end
      redirect_to todos_path
    else redirect_to root_path     end
  end
end
