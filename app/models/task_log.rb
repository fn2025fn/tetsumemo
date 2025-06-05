class TaskLog < ApplicationRecord
  belongs_to :child
  belongs_to :task_template
  has_one_attached :image

  validates :child_id, presence: true
  validates :task_template_id, presence: true

  after_create :add_point_to_child

  private

  def add_point_to_child
    child.increment!(:total_points, task_template.point)
  end
end
