class ChangeTaskTemplateIdToNullableInTaskLogs < ActiveRecord::Migration[7.1]
  def change
    change_column_null :task_logs, :task_template_id, true
  end
end
