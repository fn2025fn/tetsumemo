class AddTitleToTaskLogs < ActiveRecord::Migration[7.1]
  def change
    add_column :task_logs, :title, :string
  end
end
