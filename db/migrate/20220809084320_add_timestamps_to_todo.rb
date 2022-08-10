class AddTimestampsToTodo < ActiveRecord::Migration[7.0]
  def change
    add_column :todos, :created_at, :datetime
    add_column :todos, :updated_at, :datetime
  end
end
