class AddTotalPointsToChildren < ActiveRecord::Migration[7.1]
  def change
    add_column :children, :total_points, :integer, default: 0, null: false
  end
end
