class Todo < ApplicationRecord
  belongs_to :user

  def format_todo
    is_completed = completed ? "[x]" : "[]"
    "#{id}.#{is_completed} #{due_date.to_s} #{todo_text}"
  end

  def self.add_task(new_todo)
    create!(:todo_text => new_todo[:todo_text].to_s, :due_date => new_todo[:due_in_days], :completed => false)
  end

  def self.mark_as_complete!(todo_id)
    if todo_id == nil
      return
    end
    todo = find(todo_id)
    todo.completed = true
    todo.save
    return todo
  end

  def self.overdue
    all.order(:todo_text).where("due_date < ?", Date.today)
  end

  def self.due_today
    all.order(:todo_text).where("due_date = ?", Date.today)
  end

  def self.due_later
    all.order(:todo_text).where("due_date > ?", Date.today)
  end

  def self.completed
    all.where(completed: true)
  end
end
