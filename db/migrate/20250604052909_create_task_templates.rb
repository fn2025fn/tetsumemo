class CreateTaskTemplates < ActiveRecord::Migration[7.1]
  def change
    create_table :task_templates do |t|
      t.string :title, null: false
      t.integer :point, null: false, default: 10

      t.timestamps
    end
  end
end
