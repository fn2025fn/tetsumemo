class TaskLog < ApplicationRecord
  belongs_to :child
  belongs_to :task_template, optional: true
  has_one_attached :image

  attr_accessor :from

  validates :child_id, presence: true
  validates :task_template_id, presence: true, unless: -> { from == 'memory' }

  after_create :add_point_to_child, unless: -> { from == 'memory' }

  private

  def add_point_to_child
    child.increment!(:total_points, task_template.point)
  end
end
