class Todo < ActiveRecord::Base
  def format_todo
    is_completed = completed ? "[x]" : "[]"
    "#{id}.#{is_completed} #{due_date.to_s} #{todo_text}"
  end
end
