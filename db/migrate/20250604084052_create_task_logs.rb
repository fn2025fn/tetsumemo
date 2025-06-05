class CreateTaskLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :task_logs do |t|
      t.references :child, null: false, foreign_key: true
      t.references :task_template, null: false, foreign_key: true

      t.timestamps
    end
  end
end
